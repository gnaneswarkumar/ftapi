<?php
class MembersMapper{
    public function __construct($db){
        $this->db = $db;
    }
    public function getHeroes(){

        $sth = $this->db->prepare("SELECT ft_id as id, family_id, name, gender FROM members ORDER BY ft_id ");
        $sth->execute();
        return $sth->fetchAll();

    }

    public function getMemberDetails($id){
        $sth = $this->db->prepare("SELECT ft_id as member_id, family_id, name as member_name, dob as member_dob, dod as member_dod, gender as member_gender, wives as member_wives, mother as member_mother, father as member_father FROM members where ft_id='$id'");
        $sth->execute();
        return $sth->fetchAll();
    }

    public function getHusband($id){
        $sth = $this->db->prepare("SELECT ft_id as member_id, family_id, name as member_name, dob as member_dob, dod as member_dod, gender as member_gender, wives as member_wives, mother as member_mother, father as member_father FROM members where find_in_set('$id',wives)");
        $sth->execute();
        $husband[] = $sth->fetchAll();
        return $husband;
    }

    public function getMaleMembers(){
        $sth = $this->db->prepare("SELECT ft_id as member_id, family_id, name as member_name, dob as member_dob, dod as member_dod, gender as member_gender, wives as member_wives, mother as member_mother, father as member_father FROM members where gender='M' ORDER BY ft_id ");
        $sth->execute();
        return $sth->fetchAll();
    }

    public function getFemaleMembers(){
        $sth = $this->db->prepare("SELECT ft_id as member_id, family_id, name as member_name, dob as member_dob, dod as member_dod, gender as member_gender, wives as member_wives, mother as member_mother, father as member_father FROM members where gender='F' ORDER BY ft_id ");
        $sth->execute();
        return $sth->fetchAll();
    }
    
    public function getMemberParent($memberId){
        if(!empty($memberId)){
            return $this->getMemberDetails($memberId);
        } else {
            return array();
        }
    }

    public function getMultiAssoc($strAssocMembers){
        if($strAssocMembers!='undefined' && !empty($strAssocMembers)){
            $arrAssMembers  =   explode(',',$strAssocMembers);    
            $wives = array();
            foreach ($arrAssMembers as $key => $value) {
                $wife       = $this->getMemberDetails($value);
                $wives[]    =   $wife[0];
            }
            return $wives;
        } else {
            return array();
        }
        
    }

    public function getMemberChildren($memberId, $memberGender,$type){
        $subQuery = '';
        if($memberGender=='M'){
            //Check in father field - where father=$memberId
            $subQuery  =   "SELECT ft_id FROM members where father={$memberId}";
        }else if($memberGender=='F'){
            //Check in mother field - where mother=$memberId
            $subQuery  =   "SELECT ft_id FROM members where mother={$memberId}";
        }

        //Switch type for daughter or son
        if($type=='sons')
            $subQuery .= " and gender = 'M' ORDER BY ft_id ";
        else if($type=='daughters')
            $subQuery .= " and gender = 'F' ORDER BY ft_id ";

        $sth = $this->db->prepare($subQuery);
        $sth->execute();
        $children = $sth->fetchAll();

        $arrChildren = array();

        foreach ($children as $key => $value) {
            $memberDetails = $this->getMemberDetails($value['ft_id']);
            $arrChildren[] = $memberDetails[0];
        }
        return $arrChildren;
    }

    public function insertMember($values)
    {
        /**
            https://arjunphp.com/creating-restful-api-slim-framework/
         */
        $namesString = 'name, gender,father,mother,wives';
        $nameBindingString = ':name,:gender,:father,:mother,:wives';

        //add Dob and Dod only when they are available.   
        if(!empty($values['dob']) or $values['dob']!='Invalid Date'){
            $namesString .= ',dob';
            $nameBindingString .= ',:dob';
        }        
        
        if(!empty($values['dod']) or $values['dod']!='Invalid Date'){
            $namesString .= ',dod';
            $nameBindingString .= ',:dod';
        }

        $sql = "INSERT INTO members ($namesString) VALUES ($nameBindingString)";
        $sth = $this->db->prepare($sql);

        //$sth->bindParam("family_id", 1);
        $sth->bindParam("name", $values['name']);
        $sth->bindParam("gender", $values['gender']);
        $sth->bindParam("father", $values['father']);
        $sth->bindParam("mother", $values['mother']);
        $sth->bindParam("wives", $values['wives']);
        
        //add Dob and Dod only when they are available.   
        if(!empty($values['dob']) or $values['dob']!='Invalid Date'){
            $dob = date_format(date_create($values['dob']),"Y-m-d H:i:s");  
            $sth->bindParam("dob", $dob);  
        }        
        
        if(!empty($values['dod']) or $values['dod']!='Invalid Date'){
            $dod = date_format(date_create($values['dod']),"Y-m-d H:i:s");
            $sth->bindParam("dod", $dod);    
        }
        
        $sth->execute();
        $id = $this->db->lastInsertId();
        //$id = array('dob'=>$dob,'dod'=>$dod);

        return $id;
    }
}