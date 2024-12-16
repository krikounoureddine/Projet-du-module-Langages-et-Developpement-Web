<?php
namespace ModulePhone;

return [
    'router' => [
    'routes' => [
        'module-phone' => [
            'type' => 'Segment',
            'options' => [
                'route' => '/s/:site-slug/module-phone',
                'constraints' => [
                    'site-slug' => '[a-zA-Z0-9_-]+',
                ],
                'defaults' => [
                    '__NAMESPACE__' => 'ModulePhone\Controller',
                    'controller' => Controller\PhoneController::class,
                    'action' => 'index',
                ],
            ],
        ],
    ],
],
    'controllers' => [
        'factories' => [
            Controller\PhoneController::class => function ($serviceLocator) {
                return new Controller\PhoneController();
            },
        ],
    ],
    'view_manager' => [
    'template_path_stack' => [
        __DIR__ . '/view',
    ],
],
];
