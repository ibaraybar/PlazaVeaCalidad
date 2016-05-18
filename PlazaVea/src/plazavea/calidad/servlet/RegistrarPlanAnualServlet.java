package plazavea.calidad.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.DetallePlanAnual;
import plazavea.calidad.modelo.Empleado;
import plazavea.calidad.modelo.Local;
import plazavea.calidad.modelo.PlanAnual;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.negocio.GestionEmpleados;
import plazavea.calidad.negocio.GestionLocales;
import plazavea.calidad.negocio.GestionPlanesAnuales;
import plazavea.calidad.negocio.GestionPoliticasCalidad;
import plazavea.calidad.util.Utilitario;

/**
 * Servlet implementation class RegistrarPlanAnualServlet
 */
@WebServlet("/RegistrarPlanAnualServlet")
public class RegistrarPlanAnualServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarPlanAnualServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setAttribute("ITEM_INSP", 1);
		
		GestionLocales negocioLocal = new GestionLocales();
		try {
			Collection<Local> listaLocales = negocioLocal.listar();
			// Guardar en el ambiente de request
			request.setAttribute("LISTA_LOCALES", listaLocales);
		} catch (DAOExcepcion e) {
			System.out.println(e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
		
		GestionEmpleados negocioEmp = new GestionEmpleados();
		try {
			Collection<Empleado> listaEmpleados = negocioEmp.listar();
			// Guardar en el ambiente de request
			request.setAttribute("LISTA_EMPLEADOS", listaEmpleados);
		} catch (DAOExcepcion e) {
			System.out.println(e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
		
		GestionPoliticasCalidad negocioPC = new GestionPoliticasCalidad();
		try {
			Collection<PoliticaCalidad> listaPoliticas = negocioPC.buscar("", 0, 3000, 1);
			// Guardar en el ambiente de request
			request.setAttribute("POLITICAS_ACTIVAS", listaPoliticas);
			RequestDispatcher rd = request.getRequestDispatcher("plan-anual.jsp");
			rd.forward(request, response);
		} catch (DAOExcepcion e) {
			System.out.println(e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String anio = request.getParameter("txtanio");
		String descripPA = request.getParameter("txtdescrip");
		int anioVigencia = Integer.parseInt(anio);
		
		//Obtener la lista de Politicas de Calidad asignadas 
		ArrayList<PoliticaCalidad> politicas = new ArrayList<PoliticaCalidad>();
		
		String[] pcs= request.getParameterValues("t_idpc");
		for (int i = 0; i < pcs.length; i++) {
			if(pcs[i]!= null && !pcs[i].isEmpty());
	
			PoliticaCalidad pcal = new PoliticaCalidad();
			pcal.setIdPolitica(Integer.parseInt(pcs[i]));
			politicas.add(pcal);
		}
		System.out.println("Obtencion de politicas lista");
		
		//Obtener el Detalle del Plan Anual 
		ArrayList<DetallePlanAnual> detalle = new ArrayList<DetallePlanAnual>();
		
		String[] item= request.getParameterValues("t_item");
		String[] fecinsp= request.getParameterValues("t_fecinsp");
		String[] local= request.getParameterValues("t_local");
		String[] tipinsp= request.getParameterValues("t_tipinsp");
		String[] respo= request.getParameterValues("t_respo");
		String[] observa= request.getParameterValues("t_observa");
		for (int i = 0; i < item.length; i++) {
			if(item[i]!= null && !item[i].isEmpty());
	
			Local loc = new Local();
			loc.setIdLocal(Integer.parseInt(local[i]));
			
			Empleado res = new Empleado();
			res.setIdEmpleado(Integer.parseInt(respo[i]));
			
			Date fechaInsp = Utilitario.fnFecha2(fecinsp[i]);
			
			DetallePlanAnual insp = new DetallePlanAnual();
			insp.setFechaInspeccion(fechaInsp);
			insp.setLocalInspeccion(loc);
			insp.setTipoInspeccion(Integer.parseInt(tipinsp[i]));
			insp.setResponsable(res);
			insp.setObservaciones(observa[i]);
			detalle.add(insp);
		}
		System.out.println("Obtencion de detalle lista");
		/*
		PlanAnual nuevoPA = new PlanAnual();
		nuevoPA.setAnioVigencia(anioVigencia);
		nuevoPA.setDescripcion(descripPA);
		nuevoPA.setPoliticas(politicas);
		nuevoPA.setInspecciones(detalle);
		*/
		GestionPlanesAnuales negocioPA = new GestionPlanesAnuales();
		try {
			negocioPA.registrarPlanAnual(anioVigencia, descripPA, 1, politicas, detalle);
			System.out.println("Se grabo el Plan");
			
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		} catch (DAOExcepcion e) {
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
