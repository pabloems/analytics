import 'c3/c3.min.css';
import c3 from 'c3';

window.addEventListener("turbolinks:load", async function () {

  let data = await fetch("/main/analytics").then(r => r.json());
  // console.log(data)

  c3.generate({
    bindto: "#visits",
    data: {
      columns: [

        data.visits,
        data.events
        // ["Visitas", 1, 5, 10, 5, 8]
      ],
      type: "spline",
      colors: {
        "Visitas": "#03045E",
        "Eventos": "#90E0EF"
      }
      // type: "area-spline",
      // type: "bar"
    }

  })
});
