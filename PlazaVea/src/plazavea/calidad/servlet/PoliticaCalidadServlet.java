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

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.negocio.GestionPoliticasCalidad;

/**
 * Servlet implementation class PoliticaCalidadServlet
 */
@WebServlet("/PoliticaCalidadServlet")
public class PoliticaCalidadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoliticaCalidadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		GestionPoliticasCalidad negocioPCal = new GestionPoliticasCalidad();
		try {
			Collection<PoliticaCalidad> listaPCal = negocioPCal.listar();
			// Guardar en el ambiente de request
			request.setAttribute("PCALIDAD_REGISTRADAS", listaPCal);
			RequestDispatcher rd = request.getRequestDispatcher("politica-calidad.jsp");
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
		String politicaCalidad = request.getParameter("txtpolitica");
		String anioDesde = request.getParameter("txtanioDesde");
		String anioHasta = request.getParameter("txtanioHasta");
		String estado = request.getParameter("selestado");
		int desde = Integer.parseInt("0" + anioDesde);
		int hasta = Integer.parseInt("0" + anioHasta);
		
		Calendar fechaActual = Calendar.getInstance();
		int anioActual = fechaActual.get(Calendar.YEAR);
		if (hasta == 0) { hasta=anioActual; }
		
		GestionPoliticasCalidad negocioPCal = new GestionPoliticasCalidad();
		try {
			Collection<PoliticaCalidad> listaPCal = negocioPCal.buscar(politicaCalidad.trim(), desde, 
					hasta, Integer.parseInt(estado));
			// Guardar en el ambiente de request
			request.setAttribute("PCALIDAD_REGISTRADAS", listaPCal);
			RequestDispatcher rd = request.getRequestDispatcher("politica-calidad.jsp");
			rd.forward(request, response);

		} catch (DAOExcepcion e) {
			System.out.println(e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}

}
