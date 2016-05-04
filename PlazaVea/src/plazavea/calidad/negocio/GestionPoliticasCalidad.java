package plazavea.calidad.negocio;

import java.util.Collection;

import plazavea.calidad.dao.PoliticaCalidadDAO;
import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.PoliticaCalidad;

public class GestionPoliticasCalidad {

	public Collection<PoliticaCalidad> listar() throws DAOExcepcion {
		PoliticaCalidadDAO dao = new PoliticaCalidadDAO();

		return dao.listar();
	}
	
	public Collection<PoliticaCalidad> buscar(String politicaCalidad, int anioDesde, int anioHasta, int estado) throws DAOExcepcion {
		PoliticaCalidadDAO dao = new PoliticaCalidadDAO();

		return dao.buscar(politicaCalidad, anioDesde, anioHasta, estado);
	}
	
	public void registrarPoliticaCalidad(int anio, String nombre, String descripcion) throws DAOExcepcion {
		PoliticaCalidad pc = new PoliticaCalidad();
		pc.setAnio(anio);
		pc.setNombre(nombre);
		pc.setDescripcion(descripcion);
		pc.setActivo(true);
		
		PoliticaCalidadDAO dao = new PoliticaCalidadDAO();
		try {
			dao.insertar(pc);
		} catch (DAOExcepcion e) {
			throw e;
		}
	}
}
