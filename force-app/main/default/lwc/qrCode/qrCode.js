import { LightningElement, api } from 'lwc';
import 'c/qrCodeStandardWebComponent';

export default class QrCode extends LightningElement {

    @api value = 'https://www.texei.com/blog';
    @api label = 'QR Code';
    @api fill = '#04314E';
    @api size = '128';
    @api background = 'white';
    @api radius = 0;
    @api errorCorrection = 'H';
}