package plazavea.calidad.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.DetallePoliticaCalidad;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.util.ConexionBD;
//import plazavea.calidad.util.utilitario;

public class DetallePoliticaCalidadDAO extends BaseDAO {

	public Collection<DetallePoliticaCalidad> listarPorIdPolitica(int idPolitica) throws DAOExcepcion {
		Collection<DetallePoliticaCalidad> detallePolicitaList = new ArrayList<DetallePoliticaCalidad>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			String query = "Select id_detalle_politica, id_politica, nombre, descripcion, tipo, alerta From t_detalle_politica_calidad where id_politica = ?;";
			stmt = con.prepareStatement(query);
			stmt.setInt(1, idPolitica);
			rs = stmt.executeQuery();
			while (rs.next()) {
				DetallePoliticaCalidad detallePoliticaCalidad = new DetallePoliticaCalidad();
				detallePoliticaCalidad.setIdDetallePolitica(rs.getInt("id_detalle_politica"));
				detallePoliticaCalidad.setIdPolitica(rs.getInt("id_politica"));
				detallePoliticaCalidad.setNombre(rs.getString("nombre"));
				detallePoliticaCalidad.setDescripcion(rs.getString("descripcion"));
				detallePoliticaCalidad.setTipo(rs.getString("tipo"));
				detallePoliticaCalidad.setAlerta(rs.getBoolean("alerta"));
				
				detallePolicitaList.add(detallePoliticaCalidad);
			}

		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return detallePolicitaList;
	}
	
	public DetallePoliticaCalidad insertar(DetallePoliticaCalidad vo) throws DAOExcepcion {
		String query = "INSERT INTO t_detalle_politica_calidad (id_politica, nombre, descripcion, tipo, alerta) VALUES (?,?,?,?,?);";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = ConexionBD.obtenerConexion();
			con.setAutoCommit(false);
			stmt = con.prepareStatement(query);
			stmt.setInt(1, vo.getIdPolitica());
			stmt.setString(2, vo.getNombre());
			stmt.setString(3, vo.getDescripcion());
			stmt.setString(4, vo.getTipo());
			stmt.setBoolean(5, vo.isAlerta());
			
			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo insertar");
			}
			
			con.commit();
		}
		catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				throw new DAOExcepcion(e.getMessage());
			}
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		}
		finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				throw new DAOExcepcion(e.getMessage());
			}
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return vo;
	}
	
	public int eliminar(int idDetallePolitica){
		String query = "DELETE FROM t_detalle_politica_calidad WHERE id_detalle_politica = ?;";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int intL_resultado = 0;
		try{
			con = ConexionBD.obtenerConexion();
			con.setAutoCommit(false);
			stmt = con.prepareStatement(query);
			stmt.setInt(1, idDetallePolitica);			
			intL_resultado=stmt.executeUpdate();
			
			if(intL_resultado>0){
				con.commit();
			}else{
				con.rollback();
			}
			
			
		}catch(SQLException e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
			System.out.println("Error al ejecutar el query " +e);
		}finally{
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return intL_resultado;		
	}
	
	public void actualizar(DetallePoliticaCalidad dpc) throws DAOExcepcion {
		//System.out.println("PersonaDAO: eliminar(String personaNombre)");
		String query = "UPDATE t_detalle_politica_calidad SET nombre=?, descripcion=?, tipo=?, alerta=? WHERE id_detalle_politica=? AND id_politica =?;";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setString(1, dpc.getNombre());
			stmt.setString(2, dpc.getDescripcion());
			stmt.setString(3, dpc.getTipo());
			stmt.setBoolean(4, dpc.isAlerta());
			stmt.setInt(5, dpc.getIdDetallePolitica());
			stmt.setInt(6, dpc.getIdPolitica());
			int i = stmt.executeUpdate();
			if (i != 1) {

				throw new SQLException("No se pudo actualizar");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
	}
	
}
