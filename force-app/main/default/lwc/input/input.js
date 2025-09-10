// c-input
import { LightningElement } from "lwc";

export default class Input extends LightningElement {
  percentage = 50;

  handlePercentageChange(event) {
    const percentage = event.target.value;
    this.percentage = percentage <= 100 ? percentage : 100;
  }
}