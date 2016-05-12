package plazavea.calidad.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.Empleado;
import plazavea.calidad.modelo.Local;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.negocio.GestionEmpleados;
import plazavea.calidad.negocio.GestionLocales;
import plazavea.calidad.negocio.GestionPlanesAnuales;
import plazavea.calidad.negocio.GestionPoliticasCalidad;

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
		
		ArrayList<PoliticaCalidad> politicas = new ArrayList<PoliticaCalidad>();
		
	}

}
