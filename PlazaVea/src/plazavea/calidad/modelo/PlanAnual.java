package plazavea.calidad.modelo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

public class PlanAnual {
	
	private int idPlan;
	private int anioVigencia;
	private String descripcion;
	private int estado;
	private int aprobadoPor;
	private Date fechaAprobacion;
	private Collection<DetallePlanAnual> inspecciones = new ArrayList<DetallePlanAnual>();
	private Collection<PoliticaCalidad> politicas = new ArrayList<PoliticaCalidad>();
	
	
	public Collection<DetallePlanAnual> getInspecciones() {
		return inspecciones;
	}
	public void setInspecciones(Collection<DetallePlanAnual> inspecciones) {
		this.inspecciones = inspecciones;
	}
	public Collection<PoliticaCalidad> getPoliticas() {
		return politicas;
	}
	public void setPoliticas(Collection<PoliticaCalidad> politicas) {
		this.politicas = politicas;
	}
	public int getIdPlan() {
		return idPlan;
	}
	public void setIdPlan(int idPlan) {
		this.idPlan = idPlan;
	}
	public int getAnioVigencia() {
		return anioVigencia;
	}
	public void setAnioVigencia(int anioVigencia) {
		this.anioVigencia = anioVigencia;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getAprobadoPor() {
		return aprobadoPor;
	}
	public void setAprobadoPor(int aprobadoPor) {
		this.aprobadoPor = aprobadoPor;
	}
	public Date getFechaAprobacion() {
		return fechaAprobacion;
	}
	public void setFechaAprobacion(Date fechaAprobacion) {
		this.fechaAprobacion = fechaAprobacion;
	}
	
	public String getNombreEstado() {
		String nombreEstado="";
		
		switch (this.estado) {
		case 0: 
			nombreEstado="Registrado";
			break;
		case 1: 
			nombreEstado="Pendiente de Aprobación";
			break;
		case 2: 
			nombreEstado="Aprobado";
			break;
		case 3: 
			nombreEstado="No Vigente";
			break;
		}
		
		return nombreEstado;
	}
}
