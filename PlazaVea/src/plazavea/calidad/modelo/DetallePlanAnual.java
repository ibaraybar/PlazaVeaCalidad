package plazavea.calidad.modelo;

import java.util.Date;

public class DetallePlanAnual {
	
	private int idPlanDetalle;
	private Date fechaInspeccion;
	private Local localInspeccion;
	private int tipoInspeccion;
	private Empleado responsable;
	private String observaciones;
	public int getIdPlanDetalle() {
		return idPlanDetalle;
	}
	public void setIdPlanDetalle(int idPlanDetalle) {
		this.idPlanDetalle = idPlanDetalle;
	}
	public Date getFechaInspeccion() {
		return fechaInspeccion;
	}
	public void setFechaInspeccion(Date fechaInspeccion) {
		this.fechaInspeccion = fechaInspeccion;
	}
	public Local getLocalInspeccion() {
		return localInspeccion;
	}
	public void setLocalInspeccion(Local localInspeccion) {
		this.localInspeccion = localInspeccion;
	}
	public int getTipoInspeccion() {
		return tipoInspeccion;
	}
	public void setTipoInspeccion(int tipoInspeccion) {
		this.tipoInspeccion = tipoInspeccion;
	}
	public Empleado getResponsable() {
		return responsable;
	}
	public void setResponsable(Empleado responsable) {
		this.responsable = responsable;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
	public String getNombreTipoInspeccion() {
		String nombreTipoInspeccion="";
		
		switch (this.tipoInspeccion) {
		case 0:
			nombreTipoInspeccion="Todo el Local";
		case 1:
			nombreTipoInspeccion="En Tienda";
		case 2:
			nombreTipoInspeccion="Todo el Almacén";
		}
		
		return nombreTipoInspeccion;
	}
}
