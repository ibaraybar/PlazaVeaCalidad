package plazavea.calidad.negocio;

import java.util.Collection;

import plazavea.calidad.modelo.DetallePlanAnual;
import plazavea.calidad.modelo.PlanAnual;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.dao.PlanAnualDAO;
import plazavea.calidad.dao.PoliticaCalidadDAO;
import plazavea.calidad.excepcion.DAOExcepcion;

public class GestionPlanesAnuales {

		public void registrarPlanAnual(int anioVigencia, String descripcionPlan, int estado, 
				Collection<PoliticaCalidad> politicas, 
				Collection<DetallePlanAnual> inspecciones) throws DAOExcepcion {
			PlanAnual nPA = new PlanAnual();
			nPA.setAnioVigencia(anioVigencia);
			nPA.setDescripcion(descripcionPlan);
			nPA.setEstado(estado);
			nPA.setPoliticas(politicas);
			nPA.setInspecciones(inspecciones);
			
			PlanAnualDAO dao = new PlanAnualDAO();
			try {
				dao.insertar(nPA);
			}
			catch (DAOExcepcion e) {
				throw e;
			}
		}
		
		public Collection<PlanAnual> buscarPorPolitica(int idPolitica) throws DAOExcepcion {
			PlanAnualDAO dao = new PlanAnualDAO();

			return dao.buscarPorPolitica(idPolitica);
		}
		
		public Collection<PlanAnual> buscar(int anio, int estado) throws DAOExcepcion {
			PlanAnualDAO dao = new PlanAnualDAO();

			return dao.buscar(anio, estado);
		}
		
		public void aprobarPlan(int idPlan, int aprobadoPor) throws DAOExcepcion {
			PlanAnualDAO dao = new PlanAnualDAO();

			dao.actualizarEstado(idPlan, 2, aprobadoPor, "");
		}
		
		public void rechazarPlan(int idPlan, String motivoRechazo) throws DAOExcepcion {
			PlanAnualDAO dao = new PlanAnualDAO();

			dao.actualizarEstado(idPlan, 3, 0, motivoRechazo);
		}
}
