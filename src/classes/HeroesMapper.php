<?php
class HeroesMapper{
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
}