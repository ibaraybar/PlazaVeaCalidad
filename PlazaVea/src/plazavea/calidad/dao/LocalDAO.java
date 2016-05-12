package plazavea.calidad.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.Local;
import plazavea.calidad.util.ConexionBD;

public class LocalDAO extends BaseDAO {
	
	public Collection<Local> listar() throws DAOExcepcion {
		Collection<Local> loc = new ArrayList<Local>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			String query = "Select id_local, nombre, direccion, tipo_local From t_local;";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Local vo = new Local();
				vo.setIdLocal(rs.getInt("id_local"));
				vo.setNombre(rs.getString("nombre"));
				vo.setDireccion(rs.getString("direccion"));
				vo.setTipo(rs.getInt("tipo_local"));
				
				loc.add(vo);
			}

		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return loc;
	}
}
