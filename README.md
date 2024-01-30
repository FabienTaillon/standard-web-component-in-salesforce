# Standard Web Components in Salesforce
This a demo repo on how to use a Third-Party Web Component in Salesforce.  
You can see how to bundle an existing Web Component for Salesforce here: https://github.com/FabienTaillon/bundle-standard-web-component-for-salesforce  

You can also have a look to another repository bundling components from other frameworks to standard web components: https://github.com/FabienTaillon/standard-web-components  

Current code is using an LWC Module to import the standard web component (see [here](./force-app/main/default/lwc/qrCode/qrCode.js)):
```
import 'c/qrCodeStandardWebComponent';

export default class QrCode extends LightningElement {
    ...
}
```

Another option would be to import it from a Static Resource:
```
import { loadScript } from "lightning/platformResourceLoader";
import qrCode from "@salesforce/resourceUrl/qrCode";    

export default class QrCode extends LightningElement {
    renderedCallback() {
        loadScript(this, qrCode);
    }
}
```

One last option, if the web component export its HTMLElement and doesn't define the custom element itself, is to import and define it in your component:
```
import { PickerElement } from "c/emojiPicker";

export default class QrCode extends LightningElement {
    connectedCallback() {
        if (!customElements.get('emoji-picker')) { // if already defined, do nothing (e.g. same script imported twice)
            customElements.define('emoji-picker', PickerElement)
        }
    }
}
```

## Building the Scratch Org
Creating the demo Scratch Org is pretty easy, you'll need:
* to [setup your DevHub and install the CLI](https://trailhead.salesforce.com/fr/content/learn/modules/sfdx_app_dev/sfdx_app_dev_setup_dx) like for any work with Scratch Orgs
* install [Texeï SFDX Plugin](https://github.com/texei/texei-sfdx-plugin): `sf plugins install texei-sfdx-plugin`
* run the [createScratchOrg.sh](./createScratchOrg.sh) script
