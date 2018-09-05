<?php
header('Access-Control-Allow-Origin: *');

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../classes/MembersMapper.php';

$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$config['db']['host']   = 'localhost';
$config['db']['user']   = 'root';
$config['db']['pass']   = '';
$config['db']['dbname'] = 'ftapi';

$app = new \Slim\App(['settings' => $config]);
$container = $app->getContainer();

/*Logger*/
$container['logger'] = function($c) {
    $logger = new \Monolog\Logger('my_logger');
    $file_handler = new \Monolog\Handler\StreamHandler('../logs/app.log');
    $logger->pushHandler($file_handler);
    return $logger;
};

/*DB Connection*/
$container['db'] = function ($c) {
    $db = $c['settings']['db'];
    $pdo = new PDO('mysql:host=' . $db['host'] . ';dbname=' . $db['dbname'],
        $db['user'], $db['pass']);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    return $pdo;
};


/*$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});*/

/*Routes*/
$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    $name = $args['name'];
    $response->getBody()->write("Hello $name");

    return $response;
});

$app->get('/heroes', function (Request $request, Response $response, array $args) {
    $name = array(array(
        'id'=> 1,
        'name'=>'Tippa Raju',
        'dob'=>'',
        'dod'=>'',
        'gender'=>'male',
        'sons'=>array(array('id'=>2,'name'=>'Pedda Chennappa'),array('id'=>3,'name'=>'Chinna Chennappa')),
        'wiwes'=>array(),
        'daughters'=>array(),
        'mother'=>array(),
        'father'=>array()
     ));
    $response->getBody()->write(json_encode($name));

    return $response;
});


$app->get('/members',function(Request $request, Response $response){
    $this->logger->addInfo("heroes list");

    $mapper = new MembersMapper($this->db);
    $heroes = $mapper->getHeroes();

    //$response->getBody()->write(var_export($heroes, true));
    $response->getBody()->write(json_encode($heroes));
    return $response;
});

/**
    Get only the list of Male Members.
 */
$app->get('/malemembers',function(Request $request, Response $response){
    $this->logger->addInfo('Fetching Male Members List');

    $mapper = new MembersMapper($this->db);
    $malemembers = $mapper->getMaleMembers();

    $response->getBody()->write(json_encode($malemembers));
    return $response;
});

/**
    Get only the list of Female Members.
 */
$app->get('/femalemembers',function(Request $request, Response $response){
    $this->logger->addInfo('Fetching Female Members List');

    $mapper = new MembersMapper($this->db);
    $femaleMembers = $mapper->getFemaleMembers();

    $response->getBody()->write(json_encode($femaleMembers));
    return $response;
});


$app->get('/member/{id}',function(Request $request, Response $response, $args){
   // $this->logger->addInfo("Getting hero details {$id}");

    $ftid = (int)$args['id'];

    $mapper = new MembersMapper($this->db);
    $member   =  $mapper->getMemberDetails($ftid);

    $member[0]['member_father'] = $mapper->getMemberParent($member[0]['member_father']);
    $member[0]['member_mother'] = $mapper->getMemberParent($member[0]['member_mother']);
    $member[0]['member_wives']=$mapper->getMultiAssoc($member[0]['member_wives']);

    $member[0]['member_sons']=$mapper->getMemberChildren($ftid,$member[0]['member_gender'],'sons');
    $member[0]['member_daughters']=$mapper->getMemberChildren($ftid,$member[0]['member_gender'],'daughters');

    $response->getBody()->write(json_encode($member,true));


    return $response;
});

//$app->response()->header("Content-Type", "application/json");

$app->post('/hero/new',function(Request $request, Response $response){
    

    //$app->response()->header("Content-Type", "application/json");
    

    $data['name'] = $request->getParsedBody()['name'];
    $data['gender'] = $request->getParsedBody()['gender'];
    //$data = get_object_vars(json_decode($data));

    $member_data = [];
    $member_data['name'] = filter_var($request->getParsedBody()['name'], FILTER_SANITIZE_STRING);
    $member_data['gender'] = filter_var($request->getParsedBody()['gender'], FILTER_SANITIZE_STRING);
    $member_data['father'] = filter_var($request->getParsedBody()['father'], FILTER_SANITIZE_STRING);
    $member_data['mother'] = filter_var($request->getParsedBody()['mother'], FILTER_SANITIZE_STRING);
    $member_data['wives'] = filter_var($request->getParsedBody()['wives'], FILTER_SANITIZE_STRING);
    
    $member_data['dob'] = $request->getParsedBody()['dob'];
    $member_data['dod'] = $request->getParsedBody()['dod'];
    //echo json_encode($data);

    $mapper = new MembersMapper($this->db);
    $insertId = $mapper->insertMember($member_data);

    //Fetch the recently added member details to attach in respective lists in FrontEnd
    $insert = $mapper->getMemberDetails($insertId);

    $res['status']='success';
    $res['insert']=$insert;
    //$res['data'] = $member_data;

    $response->getBody()->write(json_encode($res));
    return $response;
});

/**
 * https://www.slimframework.com/docs/v3/tutorial/first-app.html
 */
$app->run();