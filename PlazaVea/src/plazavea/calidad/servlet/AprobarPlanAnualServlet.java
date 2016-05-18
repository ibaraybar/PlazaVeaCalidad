package plazavea.calidad.servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.PlanAnual;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.negocio.GestionPlanesAnuales;
import plazavea.calidad.negocio.GestionPoliticasCalidad;

/**
 * Servlet implementation class AprobarPlanAnualServlet
 */
@WebServlet("/AprobarPlanAnualServlet")
public class AprobarPlanAnualServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String aprobarOK = "NO";
	String rechazarOK = "NO";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AprobarPlanAnualServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		aprobarOK = "NO";
		rechazarOK = "NO";
		
		GestionPlanesAnuales negocioPlan = new GestionPlanesAnuales();
		try {
			Collection<PlanAnual> listaPlan = negocioPlan.buscar(0, -1);
			// Guardar en el ambiente de request
			request.setAttribute("PANUALES_REGISTRADOS", listaPlan);
			RequestDispatcher rd = request.getRequestDispatcher("plan-anual-aprobar.jsp");
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
		HttpSession sesion = request.getSession();
		String accion = request.getParameter("txtaccion");
		System.out.println(accion);
		aprobarOK = "NO";
		rechazarOK = "NO";
		sesion.setAttribute("APROBAR_OK",aprobarOK);
		sesion.setAttribute("RECHAZAR_OK",rechazarOK);
		
		if (accion.equalsIgnoreCase("buscar")) {
			String anio = request.getParameter("txtanio");
			String estado = request.getParameter("selestado");
			int anioInt = Integer.parseInt("0" + anio);
			int estadoint = Integer.parseInt(estado);
					
			GestionPlanesAnuales negocioPlan = new GestionPlanesAnuales();
			try {
				Collection<PlanAnual> listaPlan = negocioPlan.buscar(anioInt, estadoint);
				// Guardar en el ambiente de request
				request.setAttribute("PANUALES_REGISTRADOS", listaPlan);
				RequestDispatcher rd = request.getRequestDispatcher("plan-anual-aprobar.jsp");
				rd.forward(request, response);

			} catch (DAOExcepcion e) {
				System.out.println(e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		}
		else if (accion.equalsIgnoreCase("aprobar")) {
			String PlanAprueba = request.getParameter("txtPlanAprueba");
			int idPlanAprueba = Integer.parseInt(PlanAprueba);			
			GestionPlanesAnuales negocioPlan = new GestionPlanesAnuales();
			try {
				negocioPlan.aprobarPlan(idPlanAprueba, 1);
				aprobarOK = "SI";
				sesion.setAttribute("APROBAR_OK",aprobarOK);
				RequestDispatcher rd = request.getRequestDispatcher("plan-anual-aprobar.jsp");
				rd.forward(request, response);
			} catch (DAOExcepcion e) {
				aprobarOK = "NO";
				sesion.setAttribute("APROBAR_OK",aprobarOK);
				System.out.println(e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		}
		else if (accion.equalsIgnoreCase("rechazar")) {
			String planRechaza = request.getParameter("txtPlanRechaza");
			String motivoRechazo = request.getParameter("txtMotivoRechazo");
			int idPlanRechaza = Integer.parseInt(planRechaza);			
			GestionPlanesAnuales negocioPlan = new GestionPlanesAnuales();
			try {
				negocioPlan.rechazarPlan(idPlanRechaza, motivoRechazo);
				rechazarOK = "SI";
				sesion.setAttribute("RECHAZAR_OK",rechazarOK);
				RequestDispatcher rd = request.getRequestDispatcher("plan-anual-aprobar.jsp");
				rd.forward(request, response);
			} catch (DAOExcepcion e) {
				rechazarOK = "NO";
				sesion.setAttribute("RECHAZAR_OK",rechazarOK);
				System.out.println(e.getMessage());
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		}
	}

}
