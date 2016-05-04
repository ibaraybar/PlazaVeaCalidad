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
			String query = "Select id_detalle_politica, id_politica, nombre, descripcion From t_detalle_politica_calidad;";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				DetallePoliticaCalidad detallePoliticaCalidad = new DetallePoliticaCalidad();
				detallePoliticaCalidad.setIdDetallePolitica(rs.getInt("id_detalle_politica"));
				detallePoliticaCalidad.setIdPolitica(rs.getInt("id_politica"));
				detallePoliticaCalidad.setNombre(rs.getString("nombre"));
				detallePoliticaCalidad.setDescripcion(rs.getString("descripcion"));
//				vo.setDescripcion(rs.getString("tipo"));
//				vo.setActivo(rs.getBoolean("alerta"));
				
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
	
}
