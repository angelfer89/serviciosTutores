<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once(APPPATH.'/libraries/REST_Controller.php');
use Restserver\libraries\REST_Controller;

class TutorService extends REST_Controller {
    
    public function __construct(){
        
        header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding, THUTON-API-KEY");
        header("Access-Control-Allow-Origin: *");

        //header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, X-Access-Token");

        parent::__construct();
        $this->load->database();
        $this->load->helper('date');
    }
    
//http://www.michael-pratt.com/blog/7/Encontrar-Lugares-cercanos-con-MySQL-y-PHP/

    public function ObtenerTutores_get()
    {
        try{
            $idMateria = $this->uri->segment(3);
            $distance = $this->uri->segment(4);
            $lat = $this->uri->segment(5);
            $lng = $this->uri->segment(6);

            $box = $this->getBoundaries($lat, $lng, $distance);
            $query = $this->db->query('SELECT t.nombre,t.telefono, t.correo, t.direccion, t.latitud, t.longitud,
            (6371 * ACOS( SIN(RADIANS(t.latitud)) 
            * SIN(RADIANS(' . $lat . ')) + COS(RADIANS(t.longitud - ' . $lng . ')) 
            * COS(RADIANS(t.latitud)) * COS(RADIANS(' . $lat . ')))) AS distance 
            FROM tutor t INNER JOIN tutoresmaterias tm ON t.idTutor = tm.idTutor
            WHERE (t.latitud BETWEEN ' . $box['min_lat']. ' AND ' . $box['max_lat'] . ') 
            AND (t.longitud BETWEEN ' . $box['min_lng']. ' AND ' . $box['max_lng']. ') 
            AND tm.idMateria = "' . $idMateria . '"
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
        $request = $this->post();
        $now = date("Y-m-d");
        $idTutor =  time();

        try{
            
            $data = array(
                'idTutor' => $idTutor,
                'nombre' => $request['nombre'],
                'direccion' => $request['direccion'],
                'correo' => $request['correo'],
                'telefono' => $request['telefono'],
                'latitud' => $request['latitud'],
                'longitud' => $request['longitud'],
                'comentarios' => $request['comentarios'],
                'fechaRegistro' => $now,
                'fechaUltimoPago' => null,            
                'fechaProximoPago' => null,
                'procesado' => false,
                'activo' => false
            ); 
            
            $query = $this->db->insert('tutor', $data);

    
            if(!$query){
                $db_error = $this->db->error();
                throw new Exception('Database error! ' . $db_error['message']);  
            }
    
            $respuesta = array(
                'error' => FALSE,
                'insertado' => $idTutor
            );
        }
        catch(Exception $e){
            $respuesta = array(
                'error' => TRUE,
                'mensaje' => $e->getMessage(),
                'codeError' => $db_error['code']
            );
        }
        finally{
            $this->response($respuesta);
        }
    }

    public function RegistrarMateriaSeleccionada_post()
    {   
        $request = $this->post();

        try{
            
            $data = array(
                'idTutor' => $request['idTutor'],
                'idMateria' => $request['idMateria'],
              
            ); 
            
            $query = $this->db->insert('tutoresMaterias', $data);

    
            if(!$query){
                $db_error = $this->db->error();
                throw new Exception('Database error! ' . $db_error['message']);  
            }
    
            $respuesta = array(
                'error' => FALSE,
                'insertado' => 'OK'
            );
        }
        catch(Exception $e){
            $respuesta = array(
                'error' => TRUE,
                'mensaje' => $e->getMessage(),
                'codeError' => $db_error['code']
            );
        }
        finally{
            $this->response($respuesta);
        }
    }
    
    public function ObtenerMaterias_get()
    {
        try{
            
            $query = $this->db->query('SELECT * FROM materias');

            if(!$query){
                $db_error = $this->db->error();
                throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);  
            }

            $result = $query->result_array();

            // Convierte el int de checked en true o false
            for($i=0; $i<count($result); $i++){
                $temp = $result[$i];
                $temp['checked'] = ( $temp['checked'] == "0" ) ? false : true;
                $result[$i] = $temp;
            }

            $respuesta = array(
                'error' => FALSE,
                'materias' => $result
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

    public function ObtenerDistanciaMaxima_get()
    {
        try{
            
            $query = $this->db->query('SELECT valor FROM parametros WHERE idParametro = 1');

            if(!$query){
                $db_error = $this->db->error();
                throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);  
            }

            $respuesta = array(
                'error' => FALSE,
                'distancia' => $query->result_array()
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

    public function ObtenerNiveles_get()
    {
        try{
            
            $query = $this->db->query('SELECT * FROM niveles');

            if(!$query){
                $db_error = $this->db->error();
                throw new Exception('Database error! Error Code [' . $db_error['code'] . '] Error: ' . $db_error['message']);  
            }

            $respuesta = array(
                'error' => FALSE,
                'niveles' => $query->result_array()
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

    public function EnviarEmail()
    {
         //Cargamos la librería email
       $this->load->library('email');
        
       /*
        * Configuramos los parámetros para enviar el email,
        * las siguientes configuraciones es recomendable
        * hacerlas en el fichero email.php dentro del directorio config,
        * en este caso para hacer un ejemplo rápido lo hacemos
        * en el propio controlador
        */
        
       //Indicamos el protocolo a utilizar
        $config['protocol'] = 'smtp';
         
       //El servidor de correo que utilizaremos
        $config["smtp_host"] = 'smtp.gmail.com';
         
       //Nuestro usuario
        $config["smtp_user"] = 'angel.salgado,ponce@gmail.com';
         
       //Nuestra contraseña
        $config["smtp_pass"] = 'Firulais89';   
         
       //El puerto que utilizará el servidor smtp
        $config["smtp_port"] = '587';
        
       //El juego de caracteres a utilizar
        $config['charset'] = 'utf-8';
 
       //Permitimos que se puedan cortar palabras
        $config['wordwrap'] = TRUE;
         
       //El email debe ser valido 
       $config['validate'] = true;
       
        
      //Establecemos esta configuración
        $this->email->initialize($config);
 
      //Ponemos la dirección de correo que enviará el email y un nombre
        $this->email->from('angel.salgado.ponce@gmail.com', 'Angel Salgado');
         
      /*
       * Ponemos el o los destinatarios para los que va el email
       * en este caso al ser un formulario de contacto te lo enviarás a ti
       * mismo
       */
        $this->email->to('angel.salgado.ponce@gmail.com', 'Angel Salgado');
         
      //Definimos el asunto del mensaje
        $this->email->subject($this->input->post("asunto"));
         
      //Definimos el mensaje a enviar
        $this->email->message(
                "Email: ".$this->input->post("email").
                " Mensaje: ".$this->input->post("mensaje")
                );
         
        //Enviamos el email y si se produce bien o mal que avise con una flasdata
        if($this->email->send()){
            $this->session->set_flashdata('envio', 'Email enviado correctamente');
        }else{
            $this->session->set_flashdata('envio', 'No se a enviado el email');
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