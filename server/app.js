var paypal = require('paypal-rest-sdk');
var express = require('express');
const { response } = require('express');
var app = express();

var bodyParser = require('body-parser');
app.use(
    bodyParser.urlencoded({
        extended: false
    })
);
app.use(bodyParser.json());

var totalamount = 0.0;

// 1- make configuration to paypal
paypal.configure({
    'mode': 'sandbox',
    'client_id': 'AQHOgahdoeNG10SsIGKphON3Umne3Qna-cRj_vd6L8QQgS7JfmtxGnvcXnAu87gcH_PLNusXM2mxBOUn',
    'client_secret': 'EMI5TYxIZiwbavUEpGgN570oUOat1tjvcHptfUpYwFlDuW3duRp590kYIqRggucau4PesNFJRSgvzZ2G',
});

app.post('/pay', (req, res) => {
    console.log(req.body);
    totalamount = req.body.total;
    var create_payment_json = {
        "intent": "sale",
        "payer": {
            "payment_method": "paypal"
        },
        "redirect_urls": {
            "return_url": "http://10.0.2.2:8000/success",
            "cancel_url": "http://cancel.url"
        },
        "transactions": [{
            "item_list": {
                "items": [
                    {
                        "name": "item",
                        "price": totalamount,
                        "currency": "USD",
                        "quantity": 1
                    }
                ],
            },
            "amount": {
                "currency": "USD",
                "total": totalamount
            },
            "description": "This is the payment description."
        }]
    };


    paypal.payment.create(create_payment_json, function (error, payment) {
        if (error) {
            throw error;
        } else {
            console.log(payment);
            for (var i = 0; i < payment.links.length; i++) {
                if (payment.links[i].rel == "approval_url") {
                    res.redirect(payment.links[i].href);
                }
            }
        }
    });
});

app.get('/success', (req, res) => {
    var execute_payment_json = {
        "payer_id": req.query.PayerID,
        "transactions": [{
            "amount": {
                "currency": "USD",
                "total": totalamount
            }
        }]
    };

    var paymentId = req.query.paymentId;

    paypal.payment.execute(paymentId, execute_payment_json, (error, payment) => {
        if (error) {
            console.log(error.response);
            throw error;
        } else {
            console.log(JSON.stringify(payment));
            res.redirect('http://10.0.2.2:8000/done');
        }
    });
});

app.get('/done', (req, res) => {
    res.send('Finish payment successfully');
});

app.listen(8000, '127.0.0.1', (req, res) => {
    console.log('Server Started');
});