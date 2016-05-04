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
import plazavea.calidad.modelo.DetallePoliticaCalidad;
import plazavea.calidad.modelo.PoliticaCalidad;
import plazavea.calidad.negocio.GestionPoliticasCalidad;

/**
 * Servlet implementation class DetallePoliticaCalidadServlet
 */
@WebServlet("/DetallePoliticaCalidadServlet")
public class DetallePoliticaCalidadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetallePoliticaCalidadServlet() {
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
			int idPolitica = Integer.parseInt(request.getParameter("idPolitica"));
			PoliticaCalidad politicaCalidad = negocioPCal.buscarPorId(idPolitica);
			Collection<DetallePoliticaCalidad> detallePoliticaList = negocioPCal.listarPorIdPolitica(idPolitica);
			// Guardar en el ambiente de request
			request.setAttribute("politicaCalidad", politicaCalidad);
			request.setAttribute("detallePoliticaList", detallePoliticaList);
			RequestDispatcher rd = request.getRequestDispatcher("detalle-politica-calidad.jsp");
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
			RequestDispatcher rd = request.getRequestDispatcher("politica-calidad.jsp");
			rd.forward(request, response);

		} catch (DAOExcepcion e) {
			System.out.println(e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}

}
