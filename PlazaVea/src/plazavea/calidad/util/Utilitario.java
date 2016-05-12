package plazavea.calidad.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Utilitario {
	
	public static int idPerfilAdmistrador(){
		return 1;
	}
	public static int idPerfilResidente(){
		return 2;
	}
	
	public static Date fnFechaHora(String _fecha){
		_fecha=_fecha.replace("T", " ");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		Date date = null;
		
		try {
			date = format.parse(_fecha);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return date;
	}
	
	public static Date fnFechaHora2(String _fecha){
		_fecha=_fecha.replace("T", " ");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = null;
		
		try {
			date = format.parse(_fecha);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return date;
	}
	
	public static Date fnFecha(String _fecha){
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		
		try {
			date = format.parse(_fecha);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return date;
	}
	
	public static String fnFechaHora(Date _fecha){		
		SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy HH:mm");
		return ft.format(_fecha);		
	}
	
	public static String fnFecha(Date _fecha){		
		SimpleDateFormat ft = new SimpleDateFormat ("dd-MM-yyyy");
		return ft.format(_fecha);		
	}
	
	
	public static String fnFechaHoraMySql(Date date) {
	    String fechaMySql = "";
	    if (date == null) {
	    	fechaMySql = null;
	    } else {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        fechaMySql = sdf.format(date);
	    }
	    return fechaMySql;
	}
	public static String fnFechaMySql(Date date) {
	    String fechaMySql = "";
	    if (date == null) {
	    	fechaMySql = null;
	    } else {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        fechaMySql = sdf.format(date);
	    }
	    return fechaMySql;
	}
	
	
	
	public static String fnMensajeTrans(Object respuesta){
		String html="";
		
		if(respuesta!=null){
			html="<div class=\"alert [TIPO_ALERT] alert-dismissible fade in\" role=\"alert\" id=\"lyMensajeOk\">"
					+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>"
					+ "<strong>[MSG]</strong>"
					+ "</div>"
					+ "<script>$(\"#lyMensajeOk\").delay(900).fadeTo(900, 0);</script>";
			
			if(respuesta.equals("OK")){
				html= html.replace("[TIPO_ALERT]", "alert-success");
				html= html.replace("[MSG]", "Se registro satisfactoriamente!");	
			}else{
				html= html.replace("[TIPO_ALERT]", "alert-danger");		
				html= html.replace("[MSG]", respuesta.toString() );	
			}
		}
	
		return html;
	}
}
