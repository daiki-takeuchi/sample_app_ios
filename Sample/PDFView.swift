//
//  PDFView.swift
//  Sample
//
//  Created by 竹内大貴 on 2015/08/06.
//  Copyright (c) 2015年 竹内大貴. All rights reserved.
//

import Foundation
import UIKit
class PDFView: UIView{
    var _pdfPage: CGPDFPageRef?
    
    override func drawRect(rect: CGRect){
        var context:CGContextRef = UIGraphicsGetCurrentContext();

        //上下を反転させる
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextTranslateCTM(context, 0, -CGRectGetHeight(rect));

        //PDFページのサイズを取得
        var pdfRect:CGRect = CGPDFPageGetBoxRect(_pdfPage, kCGPDFArtBox)
        CGContextScaleCTM(context,
            rect.size.width/pdfRect.size.width,
            rect.size.height/pdfRect.size.height)
        CGContextDrawPDFPage(context, _pdfPage)
    }
}