package kr.or.ddit.controller.recruiter;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;

public class CustomFontProvider extends XMLWorkerFontProvider {
    private Font defaultFont;

    public CustomFontProvider(Font defaultFont) {
        this.defaultFont = defaultFont;
    }

    @Override
    public Font getFont(String fontname, String encoding, boolean embedded, float size, int style, BaseColor color) {
        if (fontname == null) {
            return new Font(defaultFont.getBaseFont(), size, style, color);
        }
        return FontFactory.getFont(fontname, encoding, size, style, color);
    }
}