package plazavea.calidad.negocio;

import java.util.Collection;

import plazavea.calidad.dao.EmpleadoDAO;
import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.Empleado;

public class GestionEmpleados {
	
	public Collection<Empleado> listar() throws DAOExcepcion {
		EmpleadoDAO dao = new EmpleadoDAO();

		return dao.listar();
	}
}
