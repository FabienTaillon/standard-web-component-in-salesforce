import { LightningElement } from "lwc";
import 'c/qrCodeStandardWebComponent';

export default class MyLwcWithStandardWebComponent extends LightningElement {
  websiteUrl = "https://www.texei.com/blog";
  color = "#04314E";

  handleUrlChange(event) {
    if (this.refs.inputUrl.validity.valid) {
      this.websiteUrl = event.detail.value;
    }
  }

  handleColorChange(event) {
    if (event.detail.value !== '') {
        this.color = event.detail.value;
    }
  }
}
