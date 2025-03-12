import { Controller } from "@hotwired/stimulus";
import Chart from "chart.js/auto";

export default class extends Controller {
  connect() {
    const ctx = this.element.getContext("2d");

    const chartData = {
      labels: ["バーベルスクワット", "ダンベルアームカール", "懸垂"],
      datasets: [{
        label: "トレーニング結果",
        data: [70, 50, 85],
        backgroundColor: "rgba(52, 152, 219, 0.3)",
        borderColor: "#3498db",
        borderWidth: 1
      }]
    };

    const chartOptions = {
      scales: {
        r: {
          min: 0,
          max: 100
        }
      }
    };

    new Chart(ctx, {
      type: "radar",
      data: chartData,
      options: chartOptions
    });
  }
}
