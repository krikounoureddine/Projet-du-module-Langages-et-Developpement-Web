<?php
namespace ModulePhone\Controller;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;

class PhoneController extends AbstractActionController
{
    public function indexAction()
    {
        return new ViewModel([
            'message' => 'Bienvenue dans le ModulePhone sur le site spécifique !',
        ]);
    }
}
