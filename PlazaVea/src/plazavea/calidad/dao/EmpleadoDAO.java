package plazavea.calidad.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.Empleado;
import plazavea.calidad.util.ConexionBD;

public class EmpleadoDAO extends BaseDAO {
	
	public Collection<Empleado> listar() throws DAOExcepcion {
		Collection<Empleado> emp = new ArrayList<Empleado>();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = ConexionBD.obtenerConexion();
			String query = "Select id_empleado, dni, nombres, apellido_paterno, apellido_materno, telefono, celular From t_empleado;";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Empleado vo = new Empleado();
				vo.setIdEmpleado(rs.getInt("id_empleado"));
				vo.setDni(rs.getString("dni"));
				vo.setNombres(rs.getString("nombres"));
				vo.setApellidoPaterno(rs.getString("apellido_paterno"));
				vo.setApellidoMaterno(rs.getString("apellido_materno"));
				vo.setTelefono(rs.getString("telefono"));
				vo.setCelular(rs.getString("celular"));
				
				emp.add(vo);
			}

		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return emp;
	}
}
