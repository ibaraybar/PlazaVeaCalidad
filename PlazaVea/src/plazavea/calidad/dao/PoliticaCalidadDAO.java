package plazavea.calidad.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.util.ConexionBD;
//import plazavea.calidad.util.utilitario;

public class PoliticaCalidadDAO extends BaseDAO {

	public PoliticaCalidad insertar(PoliticaCalidad vo) throws DAOExcepcion {
		String query = "INSERT INTO t_politica_calidad (anio, nombre, descripcion, estado) VALUES (?,?,?,?);";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = ConexionBD.obtenerConexion();
			con.setAutoCommit(false);
			stmt = con.prepareStatement(query);
			stmt.setInt(1, vo.getAnio());
			stmt.setString(2, vo.getNombre());
			stmt.setString(3, vo.getDescripcion());
			stmt.setBoolean(4, vo.isActivo());
			
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
	
	public Collection<PoliticaCalidad> listar() throws DAOExcepcion {
		Collection<PoliticaCalidad> pcal = new ArrayList<PoliticaCalidad>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			String query = "Select id_politica, anio, nombre, descripcion, estado From t_politica_calidad;";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				PoliticaCalidad vo = new PoliticaCalidad();
				vo.setIdPolitica(rs.getInt("id_politica"));
				vo.setAnio(rs.getInt("anio"));
				vo.setNombre(rs.getString("nombre"));
				vo.setDescripcion(rs.getString("descripcion"));
				vo.setActivo(rs.getBoolean("estado"));
				
				pcal.add(vo);
			}

		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return pcal;
	}
	
	public Collection<PoliticaCalidad> buscar(String politicaCalidad, int anioDesde, int anioHasta, int estado) throws DAOExcepcion {
		Collection<PoliticaCalidad> pcal = new ArrayList<PoliticaCalidad>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			String query = "Select id_politica, anio, nombre, descripcion, estado From t_politica_calidad "
					+ "Where nombre Like ? and anio between ? and ? and estado in (?,?);";
			stmt = con.prepareStatement(query);
			stmt.setString(1, "%" + politicaCalidad + "%");
			stmt.setInt(2, anioDesde);
			stmt.setInt(3, anioHasta);
			switch (estado) {
			case 0:
				stmt.setBoolean(4, true);
				stmt.setBoolean(5, false);
				break;
			case 1:
				stmt.setBoolean(4, true);
				stmt.setBoolean(5, true);
				break;
			case 2:
				stmt.setBoolean(4, false);
				stmt.setBoolean(5, false);
				break;
			default:
				stmt.setBoolean(4, true);
				stmt.setBoolean(5, false);
				break;
			}
			rs = stmt.executeQuery();
			while (rs.next()) {
				PoliticaCalidad vo = new PoliticaCalidad();
				vo.setIdPolitica(rs.getInt("id_politica"));
				vo.setAnio(rs.getInt("anio"));
				vo.setNombre(rs.getString("nombre"));
				vo.setDescripcion(rs.getString("descripcion"));
				vo.setActivo(rs.getBoolean("estado"));
				
				pcal.add(vo);
			}

		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return pcal;
	}
	
	public PoliticaCalidad buscarPorId(int idPolitica){
		
		PoliticaCalidad politicaCalidad = new PoliticaCalidad();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try{
			con = ConexionBD.obtenerConexion();
			String query = "select * from t_politica_calidad where id_politica = ?;";
			stmt = con.prepareStatement(query);
			stmt.setInt(1, idPolitica);			
			rs = stmt.executeQuery();
			
			if(rs.next()){
				politicaCalidad.setIdPolitica(rs.getInt("id_politica"));
				politicaCalidad.setAnio(rs.getInt("anio"));
				politicaCalidad.setNombre(rs.getString("nombre"));
				politicaCalidad.setDescripcion(rs.getString("descripcion"));
			}
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		
		return politicaCalidad;
	}
	
	public void eliminar(int idPolitica) throws DAOExcepcion {
		//System.out.println("PersonaDAO: eliminar(String personaNombre)");
		String query = "DELETE FROM t_politica_calidad WHERE id_politica=?;";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, idPolitica);
			int i = stmt.executeUpdate();
			if (i != 1) {

				throw new SQLException("No se pudo eliminar");
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
	}
	
	public void actualizar(int idPolitica, int anioPolitica, String nombrePolitica, String descPolitica) throws DAOExcepcion {
		//System.out.println("PersonaDAO: eliminar(String personaNombre)");
		String query = "UPDATE t_politica_calidad SET anio=?, nombre=?, descripcion=? WHERE id_politica=?;";
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConexionBD.obtenerConexion();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, anioPolitica);
			stmt.setString(2, nombrePolitica);
			stmt.setString(3, descPolitica);
			stmt.setInt(4, idPolitica);
			int i = stmt.executeUpdate();
			if (i != 1) {

				throw new SQLException("No se pudo eliminar");
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
