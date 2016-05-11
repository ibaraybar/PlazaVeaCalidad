package plazavea.calidad.modelo;

public class Local {
	
	private int idLocal;
	private String nombre;
	private String direccion;
	private int tipo;
	
	public int getIdLocal() {
		return idLocal;
	}
	public void setIdLocal(int idLocal) {
		this.idLocal = idLocal;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	
	public String getNombreTipoLocal() {
		String nombreTipoLocal="";
		
		switch (this.tipo) {
		case 0:
			nombreTipoLocal="Tienda";
			break;
		case 1:
			nombreTipoLocal="Almacén";
			break;
		}
		
		return nombreTipoLocal;
	}
}
