<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Juros Simples</h1>
        
        <form method="post" action="">
        Capital (R$): <input type="text" name="capital"><br>
        Taxa de Juros (%): <input type="text" name="taxa"><br>
        Tempo (em meses): <input type="text" name="tempo"><br>
        <input type="submit" value="Calcular">
    </form>

    <%
        String capitalStr = request.getParameter("capital");
        String taxaStr = request.getParameter("taxa");
        String tempoStr = request.getParameter("tempo");

        if (capitalStr != null && taxaStr != null && tempoStr != null) {
            try {
                double capital = Double.parseDouble(capitalStr);
                double taxa = Double.parseDouble(taxaStr);
                double tempo = Double.parseDouble(tempoStr);

                out.println("<table border='1'>");
                out.println("<tr><th>Período (meses)</th><th>Montante Acumulado</th></tr>");
                
                for (int i = 1; i <= tempo; i++) {
                    double montante = capital * (1 + (taxa / 100) * i);
                    String montanteFormatado = String.format("%.2f", montante);
                    out.println("<tr><td>" + i + "</td><td>R$ " + montanteFormatado + "</td></tr>");
                }
                
                out.println("</table>");

            } catch (NumberFormatException e) {
                out.println("<p>Por favor, insira valores numéricos válidos.</p>");
            }
        }
    %>
</body>
</html>
