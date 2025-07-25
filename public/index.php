<?php

use DevNoKage\Router;

require_once '../app/config/bootstrap.php';

Router::setRoute($routes);

Router::resolve();