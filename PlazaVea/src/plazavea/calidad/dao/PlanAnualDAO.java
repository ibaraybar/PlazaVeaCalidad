package plazavea.calidad.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import plazavea.calidad.excepcion.DAOExcepcion;
import plazavea.calidad.util.ConexionBD;
import plazavea.calidad.util.Utilitario;
import plazavea.calidad.modelo.DetallePlanAnual;
import plazavea.calidad.modelo.PlanAnual;
import plazavea.calidad.modelo.PoliticaCalidad;

public class PlanAnualDAO extends BaseDAO {
	
	public PlanAnual insertar(PlanAnual vo) throws DAOExcepcion {

		System.out.println("PlaAnualDAO: insertar()");
		String query = "INSERT INTO t_plan_anual (anio_vigencia, descripcion, estado) VALUES (?, ?, ?);";
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			con = ConexionBD.obtenerConexion();
			con.setAutoCommit(false);
			stmt = con.prepareStatement(query);
			stmt.setInt(1, vo.getAnioVigencia());
			stmt.setString(2, vo.getDescripcion());
			stmt.setInt(3, vo.getEstado());

			int i = stmt.executeUpdate();
			if (i != 1) {
				throw new SQLException("No se pudo insertar");
			}

			int idp = 0;
			query = "SELECT IDENT_CURRENT('t_plan_anual') As 'LastID';";
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();
			if (rs.next()) {
				idp = rs.getInt(1);
			}
			vo.setIdPlan(idp);

			for (PoliticaCalidad pcal : vo.getPoliticas()) {
				query = "INSERT INTO t_plan_politica_calidad (id_plan, id_politica) VALUES (?,?);";
				stmt = con.prepareStatement(query);
				stmt.setInt(1, idp);
				stmt.setInt(2, pcal.getIdPolitica());

				int u = stmt.executeUpdate();
				if (u != 1) {
					throw new SQLException("No se pudo insertar");
				}
			}
				
			for (DetallePlanAnual dpa : vo.getInspecciones()) {
				query = "INSERT INTO t_detalle_plan_anual (id_plan, fecha_inspeccion, id_local, tipo_inspeccion, responsable, observaciones) VALUES (?,?,?,?,?,?);";
				stmt = con.prepareStatement(query);
				stmt.setInt(1, idp);
				stmt.setString(2, Utilitario.fnFechaHoraMySql(dpa.getFechaInspeccion()));
				stmt.setInt(3, dpa.getLocalInspeccion().getIdLocal());
				stmt.setInt(4, dpa.getTipoInspeccion());
				stmt.setInt(5, dpa.getResponsable().getIdEmpleado());
				stmt.setString(6, dpa.getObservaciones());

				int v = stmt.executeUpdate();
				if (v != 1) {
					throw new SQLException("No se pudo insertar");
				}
				
				int idd = 0;
				query = "SELECT IDENT_CURRENT('t_detalle_plan_anual') As 'LastID';";
				stmt = con.prepareStatement(query);
				rs = stmt.executeQuery();
				if (rs.next()) {
					idd = rs.getInt(1);
				}
				dpa.setIdPlanDetalle(idd);
			}
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				throw new DAOExcepcion(e.getMessage());
			}
			System.err.println(e.getMessage());
			throw new DAOExcepcion(e.getMessage());
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e) {
				throw new DAOExcepcion(e.getMessage());
			}
			this.cerrarResultSet(rs);
			this.cerrarStatement(stmt);
			this.cerrarConexion(con);
		}
		return vo;
	}

}
