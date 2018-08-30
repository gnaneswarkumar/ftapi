<?php
class MembersMapper{
    public function __construct($db){
        $this->db = $db;
    }
    public function getHeroes(){
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
     
     return $name;

    }

    public function getMaleMembers(){
        $sth = $this->db->prepare("SELECT * FROM members where gender='M' ORDER BY ft_id ");
        $sth->execute();
        return $sth->fetchAll();
    }

    public function getFemaleMembers(){
        $sth = $this->db->prepare("SELECT * FROM members where gender='F' ORDER BY ft_id ");
        $sth->execute();
        return $sth->fetchAll();
    }

    public function insertMember($values)
    {
        /**
            https://arjunphp.com/creating-restful-api-slim-framework/
         */
        $sql = "INSERT INTO members (name, gender,father,mother) VALUES (:name,:gender,:father,:mother)";
        $sth = $this->db->prepare($sql);

        //$sth->bindParam("family_id", 1);
        $sth->bindParam("name", $values['name']);
        $sth->bindParam("gender", $values['gender']);
        $sth->bindParam("father", $values['father']);
        $sth->bindParam("mother", $values['mother']);
        
        $sth->execute();
        $id = $this->db->lastInsertId();
        return $id;
    }
}