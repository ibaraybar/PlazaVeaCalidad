package plazavea.calidad.modelo;

public class PoliticaCalidad {

	private int idPolitica;
	private int anio;
	private String nombre;
	private String descripcion;
	private boolean activo;
	
	public int getIdPolitica() {
		return idPolitica;
	}
	public void setIdPolitica(int idPolitica) {
		this.idPolitica = idPolitica;
	}
	public int getAnio() {
		return anio;
	}
	public void setAnio(int anio) {
		this.anio = anio;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public boolean isActivo() {
		return activo;
	}
	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	public String getDescripcionActivo() {
		if (this.activo == true) { 
			return "Activo";
		}
		else {
			return "Inactivo";
		}
	}
	
}
