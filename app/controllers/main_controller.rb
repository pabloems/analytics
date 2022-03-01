class MainController < ApplicationController

  def home
  end

  def analytics

    # started_at cuando se registró la visita
    visits = Ahoy::Visit.where("started_at > ?", Date.today - 7.days)
      .group("date(started_at)")
      .pluck("COUNT(ahoy_visits.id)")

    # time cuando se registró el evento
    events = Ahoy::Event.where("time > ?", Date.today - 7.days)
      .group("date(time)")
      .pluck("COUNT(ahoy_events.id)")

    render json: {

      visits: visits.unshift("Visitas"),
      events: events.unshift("Eventos")
      # visits: ["Visitas",5,10,5,15,3],
      # events: ["Eventos", 6,15,6,11,5]
    }
  end

end
