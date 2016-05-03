package plazavea.calidad.servlet;

import java.io.IOException;
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
 * Servlet implementation class ConsultarPoliticasCalidadServlet
 */
@WebServlet("/ConsultarPoliticasCalidadServlet")
public class ConsultarPoliticasCalidadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultarPoliticasCalidadServlet() {
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
			RequestDispatcher rd = request.getRequestDispatcher("politicas-consulta.jsp");
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
		
		GestionPoliticasCalidad negocioPCal = new GestionPoliticasCalidad();
		try {
			Collection<PoliticaCalidad> listaPCal = negocioPCal.buscar(politicaCalidad, Integer.parseInt(anioDesde), 
					Integer.parseInt(anioHasta), Integer.parseInt(estado));
			// Guardar en el ambiente de request
			request.setAttribute("PCALIDAD_REGISTRADAS", listaPCal);
			RequestDispatcher rd = request.getRequestDispatcher("politicas-consulta.jsp");
			rd.forward(request, response);

		} catch (DAOExcepcion e) {
			System.out.println(e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}

}
