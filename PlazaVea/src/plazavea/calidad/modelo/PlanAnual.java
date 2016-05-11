package plazavea.calidad.modelo;

import java.util.Date;

public class PlanAnual {
	
	private int idPlan;
	private int anioVigencia;
	private String descripcion;
	private int estado;
	private int aprobadoPor;
	private Date fechaAprobacion;
	
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
