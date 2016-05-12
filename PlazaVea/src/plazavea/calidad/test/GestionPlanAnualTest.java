package plazavea.calidad.test;

import java.util.ArrayList;
import java.util.Collection;

import org.junit.Test;
import junit.framework.Assert;
import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.DetallePlanAnual;
import plazavea.calidad.modelo.Empleado;
import plazavea.calidad.modelo.Local;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.negocio.GestionPlanesAnuales;

public class GestionPlanAnualTest {

	@Test
	public void registrarPlanAnualTest() {
		
		//Politica 1
		PoliticaCalidad pc1 = new PoliticaCalidad();
		pc1.setIdPolitica(1);
		
		//Politica 2
		PoliticaCalidad pc2 = new PoliticaCalidad();
		pc2.setIdPolitica(2);
		
		//Local 1
		Local local1 = new Local();
		local1.setIdLocal(1);
		
		//Local 2
		Local local2 = new Local();
		local2.setIdLocal(2);
		
		//Empleado 1
		Empleado emp1 = new Empleado();
		emp1.setIdEmpleado(1);
		
		//Empleado 2
		Empleado emp2 = new Empleado();
		emp2.setIdEmpleado(2);
		
		//Inspeccion 1
		DetallePlanAnual dpa1 = new DetallePlanAnual();
		dpa1.setFechaInspeccion(new java.util.Date());
		dpa1.setLocalInspeccion(local1);
		dpa1.setTipoInspeccion(0);
		dpa1.setResponsable(emp1);
		dpa1.setObservaciones("Observaciones de la primera inspección");
		
		DetallePlanAnual dpa2 = new DetallePlanAnual();
		dpa2.setFechaInspeccion(new java.util.Date());
		dpa2.setLocalInspeccion(local2);
		dpa2.setTipoInspeccion(1);
		dpa2.setResponsable(emp2);
		dpa2.setObservaciones("Observaciones de la segunda inspección");
		
		Collection<PoliticaCalidad> politicas = new ArrayList<PoliticaCalidad>();
		politicas.add(pc1);
		politicas.add(pc2);
		
		Collection<DetallePlanAnual> inspecciones = new ArrayList<DetallePlanAnual>();
		inspecciones.add(dpa1);
		inspecciones.add(dpa2);
		
		GestionPlanesAnuales negocio = new GestionPlanesAnuales();
		try {
			negocio.registrarPlanAnual(2017, "Plan de Inspecciones para el Año 2017", 0, politicas, inspecciones);
		}
		catch (DAOExcepcion e) {
			Assert.fail("Falló la inserción del Plan Anual");
		}

	}
}
