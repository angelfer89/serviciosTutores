<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;

class TutorService extends REST_Controller {
    
    public function __construct(){
        
        header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Origin, Content-Type, Content-Length, Accept-Encoding, 'X-API-KEY");
        header("Access-Control-Allow-Origin: *");

        //header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, X-Access-Token");

        parent::__construct();
        $this->load->database();
    }
    
//http://www.michael-pratt.com/blog/7/Encontrar-Lugares-cercanos-con-MySQL-y-PHP/

    public function ObtenerTutores_get()
    {
        /*$query = $this->db->query('SELECT * FROM tutor');
        
        $respuesta = array(
                'error' => FALSE,
                'tutores' => $query->result_array()
            );
        
        $this->response($respuesta);*/
        try{
            $idMateria = $this->uri->segment(3);
            $distance = $this->uri->segment(4);
            $lat = $this->uri->segment(5);
            $lng = $this->uri->segment(6);
            
            //$lat  =  4.6665578;
            //$lng =  -74.0524521;
            //$distance = 1; // Sitios que se encuentren en un radio de 1KM
            $box = $this->getBoundaries($lat, $lng, $distance);
            $query = $this->db->query('SELECT t.nombre, (6371 * ACOS( SIN(RADIANS(t.latitud)) 
            * SIN(RADIANS(' . $lat . ')) + COS(RADIANS(t.longitud - ' . $lng . ')) 
            * COS(RADIANS(t.latitud)) * COS(RADIANS(' . $lat . ')))) AS distance 
            FROM tutor t INNER JOIN tutoresMaterias tm ON t.idTutor = tm.idTutor
            WHERE (t.latitud BETWEEN ' . $box['min_lat']. ' AND ' . $box['max_lat'] . ') 
            AND (t.longitud BETWEEN ' . $box['min_lng']. ' AND ' . $box['max_lng']. ') 
            AND tm.idMateria = '. $idMateria .'
            HAVING distance < ' . $distance . '
            ORDER BY distance ASC');

            if(!$query){
                $db_error = $this->db->error();
                throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);  
            }

            $respuesta = array(
                    'error' => FALSE,
                    'tutores' => $query->result_array()
                );
        }
        catch(Exception $e){
            $respuesta = array(
                'error' => TRUE,
                'mensaje' => $e->getMessage()
            );
        }
        finally{
            $this->response($respuesta);
        }     
    }

    public function RegistrarTutor_post()
    {   
        try{
            $data = array(
                'idTutor' => $this->input->post('telefono'),
                'nombre' => $this->input->post('nombre'),
                'direccion' => $this->input->post('direccion'),
                'correo' => $this->input->post('correo'),
                'telefono' => $this->input->post('telefono'),
                'link' => $this->input->post('llink'),
                'latitud' => null,
                'longitud' => null,
                'comentarios' => $this->input->post('comentarios'),
                'fechaRegistro' => '2019',
                'fechaUltimoPago' => null,            
                'fechaProximoPago' => null,
                'procesado' => false,
                'activo' => false
            );
            
            $this->db->insert('tutor', $data);
    
            $db_error = $this->db->error();
    
            if(!empty($db_error)){
                throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);            
            }
    
            $respuesta = array(
                'error' => FALSE,
                'idinsertado' => $this->db->insert_id()
            );
        }
        catch(Exception $e){
            $respuesta = array(
                'error' => TRUE,
                'mensaje' => $e->getMessage()
            );
        }
        finally{
            $this->response($respuesta);
        }
    }
    
    
    function getBoundaries($lat, $lng, $distance = 1, $earthRadius = 6371)
    {
        $return = array();
         
        // Los angulos para cada dirección
        $cardinalCoords = array('north' => '0',
                                'south' => '180',
                                'east' => '90',
                                'west' => '270');
        $rLat = deg2rad($lat);
        $rLng = deg2rad($lng);
        $rAngDist = $distance/$earthRadius;
        foreach ($cardinalCoords as $name => $angle)
        {
            $rAngle = deg2rad($angle);
            $rLatB = asin(sin($rLat) * cos($rAngDist) + cos($rLat) * sin($rAngDist) * cos($rAngle));
            $rLonB = $rLng + atan2(sin($rAngle) * sin($rAngDist) * cos($rLat), cos($rAngDist) - sin($rLat) * sin($rLatB));
             $return[$name] = array('lat' => (float) rad2deg($rLatB), 
                                    'lng' => (float) rad2deg($rLonB));
        }
        return array('min_lat'  => $return['south']['lat'],
                     'max_lat' => $return['north']['lat'],
                     'min_lng' => $return['west']['lng'],
                     'max_lng' => $return['east']['lng']);
    }
    
}