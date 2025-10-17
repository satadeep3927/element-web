# 🚀 Deploy StreamMint to Vercel

## ⚠️ Important Note
Due to webpack path complexity, manual build deployment is recommended.

## Quick Deployment Steps

### Method 1: Manual Build + Upload (Recommended)

#### Step 1: Build Locally
```bash
# Make sure you're in the element-web directory
cd element-web

# Build the project locally
yarn install
yarn clean
yarn build:genfiles

# Create webapp directory if it doesn't exist
mkdir -p webapp

# Copy essential files manually to webapp
cp res/config.json webapp/ 2>/dev/null || echo "No config.json found"
cp res/manifest.json webapp/
cp res/favicon.ico webapp/
cp -r res/themes webapp/ 2>/dev/null || echo "Themes already copied"
cp -r res/vector-icons webapp/ 2>/dev/null || echo "Icons already copied"
cp src/vector/index.html webapp/
```

#### Step 2: Deploy Static Files
1. Create a new Vercel project
2. Choose "Import Git Repository"  
3. Select your repository
4. Configure:
   - **Framework:** Other
   - **Root Directory:** `./`
   - **Build Command:** `echo "Manual build - see DEPLOY.md"`
   - **Output Directory:** `webapp`

#### Step 3: Upload Built Files
After local build succeeds:
1. Drag and drop the `webapp` folder to Vercel dashboard
2. Or use Vercel CLI: `vercel --prod`

### Method 2: Vercel CLI (Alternative)

```bash
# Install Vercel CLI
npm i -g vercel

# Login to Vercel
vercel login

# Build locally first
yarn build:genfiles

# Deploy 
vercel --prod

# Follow prompts:
# - Project name: streammint
# - Build Command: yarn vercel-build
# - Output Directory: webapp
```

### Method 3: Alternative Hosting (If Vercel issues persist)

Consider these alternatives:
- **Netlify**: Often better for complex webpack builds
- **GitHub Pages**: Free static hosting
- **Railway**: Good for Node.js apps
- **Surge.sh**: Simple static hosting

### 3. **Environment Variables (Optional)**
In Vercel dashboard → Settings → Environment Variables, add:
- `RIOT_OG_IMAGE_URL`: Your custom OpenGraph image URL
- `CSP_EXTRA_SOURCE`: Your domain for CSP (if needed)

### 4. **Custom Domain (Optional)**
In Vercel dashboard → Settings → Domains:
- Add your custom domain like `streammint.com`

## ✅ What's Included

- **Purple Theme System**: Complete dark purple accent colors across all themes
- **StreamMint Branding**: 
  - Logo integration (favicon, app icons, social previews)
  - "Welcome to StreamMint" in 17 languages
  - App name and metadata updated
- **Matrix Configuration**: Connected to matrix.org server
- **Optimized Build**: Production-ready webpack configuration
- **Security Headers**: CSP, X-Frame-Options, and other security headers
- **Static Asset Caching**: Optimized for fast loading

## 🔧 Build Configuration

The `vercel.json` configures:
- **Build Command:** `yarn build` (webpack production build)
- **Output:** `webapp/` directory (contains built assets)
- **Routing:** SPA routing with fallback to `index.html`
- **Caching:** Static assets cached for 1 year, config.json not cached
- **Security:** Security headers for production deployment

## 📱 Features After Deployment

- **Progressive Web App (PWA)**: Installable on mobile/desktop
- **Real-time Chat**: Matrix protocol with end-to-end encryption
- **Multi-language Support**: 17+ languages with StreamMint branding
- **Custom Themes**: Purple accent colors with dark/light modes
- **Mobile Responsive**: Works great on all devices

## 🌐 Production URLs

After deployment, you'll get:
- **Vercel URL**: `https://streammint-xxx.vercel.app`
- **Custom Domain**: `https://your-domain.com` (if configured)

## 🔍 Testing Your Deployment

1. Visit your deployed URL
2. Check that "StreamMint" appears in:
   - Browser title
   - Welcome message
   - App name throughout interface
3. Verify purple theme colors
4. Test Matrix login with matrix.org account
5. Check mobile PWA installation

## ⚡ Performance Tips

- Vercel automatically optimizes static assets
- Matrix homeserver location affects chat performance
- Consider custom Matrix homeserver for production use
- Enable compression and CDN caching in Vercel settings

## 🔒 Security Considerations

- Default config connects to public matrix.org server
- For production, consider private Matrix homeserver
- Environment variables secure sensitive configuration
- All communication encrypted end-to-end

Your StreamMint deployment is ready! 🎉