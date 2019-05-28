/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Interfaces.CRUD_MASCOTA;
import Config.Conexion;
import VO.MascotasVO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class MascotasDAO extends Conexion implements CRUD_MASCOTA {

    Conexion conexion = new Conexion();

    private Connection Conn = null;
    private Statement puente = null;
    private ResultSet rs = null;

    @Override
    public boolean Agregar(MascotasVO mascotasVO) {
        String Sql = "insert into mascotas(Nombre,FechaNacimiento,Sexo,FKRaza,FKUsuario) values ('" + mascotasVO.getNombre() + "','" + mascotasVO.getFechaNacimiento() + "','" + mascotasVO.getSexo() + "','" + mascotasVO.getFKRaza() + "','" + mascotasVO.getFKUsuario() + "');";
        try {
            conn = conexion.obtenerConexion();
            puente = conn.prepareStatement(Sql);
            puente.executeUpdate(Sql);

        } catch (Exception e) {
            e.getStackTrace();
        }
        return false;
    }

    @Override
    public boolean Editar(MascotasVO mascotasVO) {
        try {
            puente.executeUpdate("");
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean Eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public List Listar() {
        ArrayList<MascotasVO> List = new ArrayList<>();
        String Sql = "SELECT Nombre FROM mascotas";
        try {
            conn = conexion.obtenerConexion();
            puente = conn.prepareStatement(Sql);
            rs = puente.executeQuery(Sql);
            while (rs.next()) {
                MascotasVO mascotasVo = new MascotasVO();
                mascotasVo.setNombre(rs.getString("Nombre"));
                List.add(mascotasVo);
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
        return List;
    }
}
