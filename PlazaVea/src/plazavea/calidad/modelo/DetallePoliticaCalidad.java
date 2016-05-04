package plazavea.calidad.modelo;

public class DetallePoliticaCalidad {

	private int idDetallePolitica;
	private int idPolitica;
	private String nombre;
	private String descripcion;
	private String tipo;
	private boolean alerta; 
	
	
	public int getIdDetallePolitica() {
		return idDetallePolitica;
	}
	public void setIdDetallePolitica(int idDetallePolitica) {
		this.idDetallePolitica = idDetallePolitica;
	}
	public int getIdPolitica() {
		return idPolitica;
	}
	public void setIdPolitica(int idPolitica) {
		this.idPolitica = idPolitica;
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
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public boolean isAlerta() {
		return alerta;
	}
	public void setAlerta(boolean alerta) {
		this.alerta = alerta;
	}
//	public String getDescripcionTipo() {
//		if (this.tipo.equals("C")) { 
//			return "Crítico";
//		}
//		else {
//			return "Normal";
//		}
//	}
//	public String getDescripcionAlerta() {
//		if (this.alerta == true) { 
//			return "Si";
//		}
//		else {
//			return "No";
//		}
//	}
		
}
