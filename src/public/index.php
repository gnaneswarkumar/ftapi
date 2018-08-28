<?php
header('Access-Control-Allow-Origin: *');

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../classes/HeroesMapper.php';

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


$app->get('/heros',function(Request $request, Response $response){
    $this->logger->addInfo("heroes list");

    $mapper = new HeroesMapper($this->db);
    $heroes = $mapper->getHeroes();

    //$response->getBody()->write(var_export($heroes, true));
    $response->getBody()->write(json_encode($heroes));
    return $response;
});

$app->get('/hero/{id}',function(Request $request, Response $response, $args){
   // $this->logger->addInfo("Getting hero details {$id}");

    $ftid = (int)$args['id'];

    $mapper = new HeroesMapper($this->db);
    //$hero   =  $mapper->getHeroDetails($id);

    //$response->getBody()->write(var_export($hero,true));
    return $response;
});


$app->post('/hero/new',function(Request $request, Response $response){
    $data = $request->getParsedBody();
    //$data = json_decode($data);
    /*$fm_data = [];
    $fm_data['id'] = filter_var($request->params('member_id'), FILTER_SANITIZE_STRING);
    $fm_data['name'] = filter_var($request->params('member_name'), FILTER_SANITIZE_STRING);*/

    $response->getBody()->write(json_encode($data));
    return $response;
});

/**
 * https://www.slimframework.com/docs/v3/tutorial/first-app.html
 */
$app->run();