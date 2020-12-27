var express = require('express'),
    path = require('path'),
    bodyParser = require('body-parser'),
    cons = require('consolidate'),
    dust = require('dustjs-helpers'),
    pg = require('pg'),
    app = express();


// Assign Dust Engine To .dust Files
app.engine('dust', cons.dust);

// Set Default Ext .dust
app.set('view engine', 'dust');
app.set('views', __dirname + '/views');

// Set Public Folder
app.use(express.static(path.join(__dirname, 'public')));

// Body Parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var config = {
    user: 'postgres',
    database: 'hardware_shop',
    password: 'root',
    port: 5432
};

const pool = new pg.Pool(config);

app.get('/', function(req, res) {
    res.render('layout');
});

// order
app.get('/order', function(req, res){
    pool.connect(function(err, client, done) {
        if (err) {
            console.log("Can not connect to the DB" + err);
        }
        client.query('select * from "order"',  function (err, result) {
            done();
            if (err) {
                console.log(err);
                res.status(400).send(err);
            }
            res.render('order', {order: result.rows});
        });
    });
});

// order_details
app.get('/order_details', function(req, res){
    pool.connect(function(err, client, done) {
        if (err) {
            console.log("Can not connect to the DB" + err);
        }
        client.query('select * from order_details',  function (err, result) {
            done();
            if (err) {
                console.log(err);
                res.status(400).send(err);
            }
 
            res.render('order_details', {order_details: result.rows});
        });
    });
});

// client
app.get('/client', function(req, res){
    pool.connect(function(err, client, done) {
        if (err) {
            console.log("Can not connect to the DB" + err);
        }
        client.query('select * from client',  function (err, result) {
            done();
            if (err) {
                console.log(err);
                res.status(400).send(err);
            }

            res.render('client', {client: result.rows});
        });
    });
});

// employee
app.get('/employee', function(req, res){
    pool.connect(function(err, client, done) {
        if (err) {
            console.log("Can not connect to the DB" + err);
        }
        client.query('select * from employee',  function (err, result) {
            done();
            if (err) {
                console.log(err);
                res.status(400).send(err);
            }

            res.render('employee', {employee: result.rows});
        });
    });
});

// warehouse
app.get('/warehouse', function(req, res){
    pool.connect(function(err, client, done) {
        if (err) {
            console.log("Can not connect to the DB" + err);
        }
        client.query('select * from warehouse',  function (err, result) {
            done();
            if (err) {
                console.log(err);
                res.status(400).send(err);
            }

            res.render('warehouse', {warehouse: result.rows});
        });
    });
});

// hardware
app.get('/hardware', function(req, res){
    pool.connect(function(err, client, done) {
        if (err) {
            console.log("Can not connect to the DB" + err);
        }
        client.query('select * from hardware',  function (err, result) {
            done();
            if (err) {
                console.log(err);
                res.status(400).send(err);
            }

            res.render('hardware', {hardware: result.rows});
        });
    });
});

// categories
app.get('/categories', function(req, res){
    pool.connect(function(err, client, done) {
        if (err) {
            console.log("Can not connect to the DB" + err);
        }
        client.query('select * from categories',  function (err, result) {
            done();
            if (err) {
                console.log(err);
                res.status(400).send(err);
            }

            res.render('categories', {categories: result.rows});
        });
    });
});

// manufacturer
app.get('/manufacturer', function(req, res){
    pool.connect(function(err, client, done) {
        if (err) {
            console.log("Can not connect to the DB" + err);
        }
        client.query('select * from manufacturer',  function (err, result) {
            done();
            if (err) {
                console.log(err);
                res.status(400).send(err);
            }

            res.render('manufacturer', {manufacturer: result.rows});
        });
    });
});

// Add record
app.post('/:pathname/add', function(req, res) {
    function addTo(table, values) {
        // order
        if (table === 'order') {
            pool.connect(function(err, client, done) {
                
                if (err) {
                    console.log("Can not connect to the DB" + err);
                }
                client.query(`insert into "order" (client_id, employee_id, hardware_warehouse, order_date) values (`+ values.client_id +`, ` + values.employee_id +`, `+ values.hardware_warehouse +`, '`+ values.order_date +`')`, function (err, result) {
                    done();
                    res.redirect('/' + req.params.pathname);
                });
            });
        }
        else if (table === 'order_details') {
            pool.connect(function(err, client, done) {
                
                if (err) {
                    console.log("Can not connect to the DB" + err);
                }
                client.query(`insert into "order_details" (order_id, hardware_id, quantity, discount) values (`+ values.order_id +`, ` + values.hardware_id +`, `+ values.quantity +`, `+ values.discount +`)`, function (err, result) {
                    done();
                    res.redirect('/' + req.params.pathname);
                });
            });
        }
        else if (table === 'client') {
            pool.connect(function(err, client, done) {
                
                if (err) {
                    console.log("Can not connect to the DB" + err);
                }
                client.query(`insert into "client" (first_name, second_name, phone_number, email_address) values ('`+ values.first_name +`', '` + values.second_name +`', '`+ values.phone_number +`', '`+ values.email_address +`')`, function (err, result) {
                    done();
                    res.redirect('/' + req.params.pathname);
                });
            });
        }
        else if (table === 'employee') {
            pool.connect(function(err, client, done) {
                
                if (err) {
                    console.log("Can not connect to the DB" + err);
                }
                client.query(`insert into "employee" (first_name, second_name, title, phone_number, email_address, home_address, date_of_birth) values ('`+ values.first_name +`', '` + values.second_name +`', '`+ values.title +`', '`+ values.phone_number +`', '`+ values.email_address +`', '`+ values.home_address +`', '`+ values.date_of_birth +`')`, function (err, result) {
                    done();
                    res.redirect('/' + req.params.pathname);
                });
            });
        }
        else if (table === 'hardware') {
            pool.connect(function(err, client, done) {
                
                if (err) {
                    console.log("Can not connect to the DB" + err);
                }
                client.query(`insert into "hardware" (category_id, manufacturer_id, name, color, material_type, connection_type, size, weight, description) values ('`+ values.category_id +`', '` + values.manufacturer_id +`', '`+ values.name +`', '`+ values.color +`', '`+ values.material_type +`', '`+ values.connection_type +`', '`+ values.size +`', '`+ values.weight +`', '`+ values.description +`' )`, function (err, result) {
                    done();
                    res.redirect('/' + req.params.pathname);
                });
            });
        }
    }
    //console.log(req.params.pathname, req.body);
    addTo(req.params.pathname, req.body);
})

// Delete record
app.delete('/:pathname/delete/:id', function(req, res) {
    function deleteFrom(table, value) {
        pool.connect(function(err, client, done) {
            if (err) {
                console.log("Can not connect to the DB" + err);
            }
            client.query(`delete from "`+ table +`" where `+ value +``, function (err, result) {
                done();
                res.sendStatus(200);
            });
        });
    }
    deleteFrom([req.params.pathname], [req.params.id]);
})


// Edit record
app.post('/:pathname/edit', function(req, res) {
    if (req.params.pathname === 'order') {
        pool.connect(function(err, client, done) {
            if (err) {
                console.log("Can not connect to the DB" + err);
            }
            client.query('update "order" set client_id = $1, employee_id = $2, hardware_warehouse = $3, order_date = $4 where order_id= $5;', [req.body.client_id, req.body.employee_id, req.body.hardware_warehouse, req.body.order_date, req.body.id],  function (err, result) {
                done();
                res.redirect('/' + req.params.pathname);
            });
        });
    }
    else if (req.params.pathname === 'order_details') {
        pool.connect(function(err, client, done) {
            if (err) {
                console.log("Can not connect to the DB" + err);
            }
            client.query('update "order_details" set order_id = $1, hardware_id = $2, quantity = $3, discount = $4 where order_id= $5;', [req.body.order_id, req.body.hardware_id, req.body.quantity, req.body.discount, req.body.order_id],  function (err, result) {
                done();
                res.redirect('/' + req.params.pathname);
            });
        });
    }
    else if (req.params.pathname === 'client') {
        pool.connect(function(err, client, done) {
            if (err) {
                console.log("Can not connect to the DB" + err);
            }
            client.query(`update "client" set first_name = '`+ req.body.first_name +`', second_name = '`+ req.body.second_name +`', phone_number = '`+ req.body.phone_number +`', email_address = '`+ req.body.email_address +`' where client_id= `+ req.body.id +`;`,  function (err, result) {
                done();
                res.redirect('/' + req.params.pathname);
            });
        });
    }
    else if (req.params.pathname === 'hardware') {
        pool.connect(function(err, client, done) {
            if (err) {
                console.log("Can not connect to the DB" + err);
            }
            client.query(`update "hardware" set category_id = '`+ req.body.category_id +`', manufacturer_id = '`+ req.body.manufacturer_id +`', name = '`+ req.body.name +`', color = '`+ req.body.color +`', material_type = '`+ req.body.material_type +`', connection_type = '`+ req.body.connection_type +`', size = '`+ req.body.size +`', weight = '`+ req.body.weight +`', description = '`+ req.body.description +`' where hardware_id= `+ req.body.id +`;`,  function (err, result) {
                done();
                res.redirect('/' + req.params.pathname);
            });
        });
    }
    
})

// Server 
app.listen(3000, function(){
    console.log('Server Started On Port 3000');
})