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
}
