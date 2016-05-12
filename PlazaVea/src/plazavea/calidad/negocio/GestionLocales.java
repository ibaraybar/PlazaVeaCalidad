package plazavea.calidad.negocio;

import java.util.Collection;

import plazavea.calidad.dao.LocalDAO;
import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.Local;

public class GestionLocales {
	
	public Collection<Local> listar() throws DAOExcepcion {
		LocalDAO dao = new LocalDAO();

		return dao.listar();
	}
}
