<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;

class TutorService extends REST_Controller {
    
    public function __construct(){
        
        header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding");
        header("Access-Control-Allow-Origin: *");
        
        parent::__construct();
        $this->load->database();
    }
    
    public function ObtenerTutores_get()
    {
        /*$query = $this->db->query('SELECT * FROM tutor');
        
        $respuesta = array(
                'error' => FALSE,
                'tutores' => $query->result_array()
            );
        
        $this->response($respuesta);*/
        
        
        $lat  =  4.6665578;
        $lng =  -74.0524521;
        $distance = 1; // Sitios que se encuentren en un radio de 1KM
        $box = $this->getBoundaries($lat, $lng, $distance);
        $query = $this->db->query('SELECT *, (6371 * ACOS( SIN(RADIANS(latitud)) 
        * SIN(RADIANS(' . $lat . ')) + COS(RADIANS(longitud - ' . $lng . ')) 
        * COS(RADIANS(latitud)) * COS(RADIANS(' . $lat . ')))) AS distance 
        FROM tutor 
        WHERE (latitud BETWEEN ' . $box['min_lat']. ' AND ' . $box['max_lat'] . ') 
        AND (longitud BETWEEN ' . $box['min_lng']. ' AND ' . $box['max_lng']. ') 
        HAVING distance  < ' . $distance . ' 
        ORDER BY distance ASC');
        //$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $respuesta = array(
                'error' => FALSE,
                'tutores' => $query->result_array()
            );
        
        $this->response($respuesta);
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