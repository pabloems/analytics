Ahoy - Gem

articles_controller
  def show
    # Guarda el nuevo evento de la visita
    # Se puede modifica el evento que se quiere trackear,
    # en este caso es una visita
    ahoy.track "Articulo visitado", {article: @article.id}
  end
end

nos registra las visitas de los usuarios y los detalles de este, ya sea browser, os(sistema-operativo), user_id, ip y más.
Una visita de usuario se registra una vez cada cuatro 4, su navegación completa representa solo 1 visita.

Para consultar detalles en nuestra terminal, por ej:

Cuantas visitas hemos tenido, las cuales se guardan en el servidor
Ahoy::Visit.count

Detalles de la última visita
Ahoy::Visit.last

Consultar detalle del último evento
Ahoy::Visit.last.events

Graficación con librería C3.js

Instalar dependencias C3 medíante webpack(rails >6 lo trae por defecto)
yarn add c3

Manejo
Javascript folder -> graphs

Lógica en main_controller para obtener visitas del día de hoy y hace 7 dias
{Crud de Articles creado con Scaffold}

![gráfico](https://user-images.githubusercontent.com/79098599/156125095-478291e2-da3e-4f26-a8c8-608a629644fd.png)

