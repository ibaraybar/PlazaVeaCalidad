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

import plazavea.calidad.dao.DetallePoliticaCalidadDAO;
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
	String buscarOK = "NO";
	String insertarOK = "NO";
	String eliminarOK = "NO";
	String editarOK = "NO";
       
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
			request.setAttribute("idPolitica", idPolitica);
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
		HttpSession sesion = request.getSession();
		
		String accion = request.getParameter("txtaccion");
		System.out.println(accion);
		
		if (accion.equalsIgnoreCase("buscar")) {
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
		else if (accion.equalsIgnoreCase("insertar")) {
			
			System.out.println("bdhdshdshdshds"+ request.getParameter("txtidpolitica"));
			int idPolitica = Integer.parseInt(request.getParameter("txtidpolitica"));
			String nombre = request.getParameter("txtnombre");
			String descripcion = request.getParameter("txtdescripcion");
			String tipo = request.getParameter("txttipo");
			String alerta = request.getParameter("txtalerta");
			boolean alertaFlag = false;
			
			if (alerta.equals("S")) {
				alertaFlag = true;
			}
					
			GestionPoliticasCalidad negocioPC = new GestionPoliticasCalidad();
			try {
				negocioPC.registrarDetallePoliticaCalidad(idPolitica, nombre, descripcion, tipo, alertaFlag);
				response.sendRedirect(request.getContextPath()	+ "/DetallePoliticaCalidadServlet?idPolitica=" + idPolitica);
			} catch (DAOExcepcion e) {
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		}
		
		else if (accion.equalsIgnoreCase("eliminar")) {
			System.out.println("bdhdshdshdshds======"+ request.getParameter("txtHiddenIdDPC"));
			System.out.println("bdhdshdshdshds======"+ request.getParameter("txtHiddenIdPC"));
			int idPolitica = Integer.parseInt(request.getParameter("txtHiddenIdPC"));
			int id_detalle_politica = Integer.parseInt(request.getParameter("txtHiddenIdDPC"));
			GestionPoliticasCalidad negocioPC = new GestionPoliticasCalidad();
			try {
				negocioPC.eliminarDetallePoliticaCalidad(id_detalle_politica);
				eliminarOK="SI";
				sesion.setAttribute("ELIMINAR_OK",eliminarOK);
				response.sendRedirect(request.getContextPath()	+ "/DetallePoliticaCalidadServlet?idPolitica=" + idPolitica);
			} catch (DAOExcepcion e) {
				eliminarOK="NO";
				sesion.setAttribute("ELIMINAR_OK",eliminarOK);
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
				
		}	
		
		else if (accion.equalsIgnoreCase("editar")) {
			String idDetallePolitica = request.getParameter("txtiddetallepolitica");
			String idPolitica = request.getParameter("txtidpolitica");
			String nombre = request.getParameter("txtnombre2");
			String descripcion = request.getParameter("txtdescripcion2");
			String tipo = request.getParameter("txttipo2");
			String alerta = request.getParameter("txtalerta2");
			boolean alertaFlag = false;
			
			if (alerta.equals("S")) {
				alertaFlag = true;
			}
			System.out.println(idDetallePolitica);
			int idDetallePoliticaEditar = Integer.parseInt(idDetallePolitica);
			int idPoliticaEditar = Integer.parseInt(idPolitica);
					
			GestionPoliticasCalidad negocioPC = new GestionPoliticasCalidad();
			try {
				negocioPC.actualizarDetallePoliticaCalidad(idDetallePoliticaEditar, idPoliticaEditar, nombre, descripcion, tipo, alertaFlag);
				editarOK="SI";
				sesion.setAttribute("EDITAR_OK",editarOK);
				response.sendRedirect(request.getContextPath()	+ "/DetallePoliticaCalidadServlet?idPolitica=" + idPolitica);
			} catch (DAOExcepcion e) {
				editarOK="NO";
				sesion.setAttribute("EDITAR_OK",editarOK);
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.forward(request, response);
			}
		}
	}

}
