<?php
class ControllerExtensionModuleMAnufacturer extends Controller {
	public function index($setting) {
		$this->load->language('module/manufacturer');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['manufacturer_id'] =  (string)$this->request->get['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = array();
		}


		$this->load->model('catalog/manufacturer');

		$this->load->model('catalog/product');
        $this->load->model('tool/image');
		$data['manufacturer'] = array();

		$manufacturers = $this->model_catalog_manufacturer->getManufacturers();
		foreach ($manufacturers as $manufacturer) {
			
		

			
            $image=$this->model_tool_image->resize($manufacturer['image'],169,49);
			$data['manufacturers'][] = array(
				'manufacturer_id' => $manufacturer['manufacturer_id'],
				'name'        => $manufacturer['name'] ,
                'image'       => $image,
				'href'        => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'])
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/manufacturer.tpl', $data);
		} else {
			return $this->load->view('module/manufacturer.tpl', $data);
		}
	}
}