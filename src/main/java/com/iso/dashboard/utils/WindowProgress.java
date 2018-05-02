/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iso.dashboard.utils;

import com.vaadin.server.ThemeResource;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.ProgressBar;
import com.vaadin.ui.Window;


public class WindowProgress extends Window {

    public WindowProgress(String caption) {
        setClosable(false);
        setReadOnly(true);
        setResizable(false);
        setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        setModal(true);
//        setStyleName("loading-window");
        HorizontalLayout horizontalLayout = new HorizontalLayout();
        horizontalLayout.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        horizontalLayout.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        horizontalLayout.setSpacing(true);
        horizontalLayout.setMargin(true);
        
        final ProgressBar pb = new ProgressBar();
        pb.setIndeterminate(true);
        Label lb = new Label();
        lb.setValue(caption);
        horizontalLayout.addComponent(pb);
        horizontalLayout.addComponent(lb);
        
        setContent(horizontalLayout);
    }
    
    public WindowProgress(String caption, String image) {
        setClosable(false);
        setReadOnly(true);
        setResizable(false);
        setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        setModal(true);
//        setStyleName("loading-window");
        HorizontalLayout horizontalLayout = new HorizontalLayout();
        horizontalLayout.setWidth(Constants.STYLE_CONF.AUTO_VALUE);
        horizontalLayout.setHeight(Constants.STYLE_CONF.AUTO_VALUE);
        horizontalLayout.setSpacing(true);
        horizontalLayout.setMargin(true);
        
        final ProgressBar pb = new ProgressBar();
        pb.setIndeterminate(true);
        pb.setIcon(new ThemeResource(image));
        Label lb = new Label();
        lb.setValue(caption);
        horizontalLayout.addComponent(pb);
        horizontalLayout.addComponent(lb);
        
        setContent(horizontalLayout);
    }
}
