# humanize-skills

![humanize-skills — elimina marcas de IA en 20 idiomas × 10 modos × 7 tonos](assets/banner.svg)

Una skill de estilo de escritura por IA que elimina los clichés, las frases de
relleno y las estructuras formulaicas catalogadas en la guía de Wikipedia
"Signs of AI writing" — y los rasgos discursivos que sobreviven a una edición
de vocabulario — de todo lo que un asistente de IA redacte o edite.

- **Dos pasadas.** Una pasada superficial (vocabulario, ritmo oracional, formato,
  residuos de chatbot) y una pasada estructural (moralejas explícitas, arcos
  ordenados de una sola vía, emoción mostrada en vez de nombrada, referencias
  vagas, convergencia formal en un conjunto de textos).
- **20 idiomas**, cada uno con su propio catálogo de patrones y tabla de
  registro en lugar de una lista inglesa traducida: inglés, chino, español,
  alemán, francés, ruso, japonés, turco, coreano, vietnamita, polaco, indonesio,
  ucraniano, árabe, portugués, italiano, hindi, persa, neerlandés, tailandés.
- **10 modos de propósito** sobre un único reglamento base: `general` (defecto),
  `academic`, `medical`, `legal`, `business`, `resume`, `ux`, `creative`,
  `social`, `technical`.
- **Solo prompts.** Sin script de escaneo, sin dependencias de ejecución — todo
  el motor es Markdown.

*Este archivo es la traducción al español del `README.md` en inglés. En caso de
discrepancia, prevalece la versión inglesa.*

*Idiomas: [English](README.md) · [Türkçe](README.tr.md) · [Español](README.es.md) · [Deutsch](README.de.md) · [中文](README.zh.md) · [العربية](README.ar.md) · [Français](README.fr.md)*

## Estructura del repo

```
humanize-skills/                          ← este repo
└── skills/
    └── humanize-skills/
        ├── SKILL.md                     ← enrutador: lee flags, fija orden de carga y precedencia
        └── references/
            ├── core-rules.md            ← pasada superficial universal
            ├── structural-pass.md       ← las seis auditorías discursivas
            ├── voice-calibration.md     ← cómo construir (y cómo no) un perfil de voz
            ├── languages/
            │   ├── en.md zh.md es.md de.md fr.md ru.md ja.md tr.md ko.md   (nivel 1)
            │   ├── vi.md pl.md id.md uk.md ar.md pt.md it.md hi.md fa.md nl.md th.md  (nivel 2)
            │   └── _template.md         ← formato de contribución para el idioma Nº 21+
            └── modes/
                └── general.md academic.md medical.md legal.md business.md
                    resume.md ux.md creative.md social.md technical.md
```

`SKILL.md` carga solo los archivos que cada petición necesita (núcleo +
estructural + un idioma + un modo), así que el catálogo escala por adición, no
engordando un único archivo. El diseño `skills/<nombre>/SKILL.md` es la
convención que el instalador `npx skills` (ver abajo) espera para encontrar
skills instalables en un repo.

## Cómo usarlo

Una vez instalada la skill, se invoca **pidiéndola en una petición normal** —
no hay nada que ejecutar en la terminal. Cualquier agente capaz (Claude Code,
Cursor, Codex, …) la activa automáticamente cuando una petición suena a "haz
que esto suene menos a IA", "humaniza este borrador", "quita los guiones
largos y el relleno", etc.

Los flags de ejecución son **palabras dentro de la petición**, no argumentos
del shell. Combínalos como quieras; si los omites todos, la skill usa valores
sensatos (`--general`, idioma detectado del texto).

| Flag | Qué hace | Defecto si se omite |
|---|---|---|
| `--general` `--academic` `--medical` `--legal` `--business` `--resume` `--ux` `--creative` `--social` `--technical` | Modo de propósito — fija qué se preserva y qué se elimina | `--general`, o inferido del contexto (un contrato pegado ⇒ `--legal`) |
| `--lang=xx` | Fuerza un catálogo de idioma (`en`, `zh`, `es`, `de`, `fr`, `ru`, `ja`, `tr`, `ko`, `vi`, `pl`, `id`, `uk`, `ar`, `pt`, `it`, `hi`, `fa`, `nl`, `th`) | Detectado del texto de entrada |
| `--audit` | Solo diagnóstico — agrupado por severidad (CRITICAL/HIGH/MEDIUM/LOW), **sin reescribir** | Apagado (la skill reescribe e informa) |
| `--strict` / `--light` | Fuerza una pasada más profunda o más ligera | Autoevaluado según lo mucho que suene a IA |
| `--free` / `--careful` / `--minimal` | Cuánto puede encoger el texto (borrar relleno vs. mantener 80–110% vs. solo marcas inequívocas) | `--free` para pasajes, `--careful` para documentos |
| `--write` | Redacta texto nuevo bajo las reglas en vez de limpiar texto existente | Apagado (modo reescritura) |
| `--tone=xx` | Colorido relacional: `expert` / `biz` / `human` / `social` / `landing` / `article` / `case` (los límites del modo ganan) | `human` (`expert` para legal/medical) |
| `--calibrate` | Imita la propia voz del solicitante — aporta 3–5 muestras reales | Apagado (edita hacia una base humana neutra) |
| `--redo` | Segunda pasada sobre la salida previa de la skill; acotable ("solo el segundo párrafo") | Apagado |

Cada petición abre con un **chequeo pre-vuelo**: los textos cortos (~menos de
100 palabras) saltan la puntuación; si no, la skill puntúa señales de patrones
IA de 0–100 y se DETIENE con solo diagnóstico cuando el texto ya suena humano
(guardia ponderada, excepciones por idioma en `SKILL.md`). Di "reescribe igual"
para forzar una pasada mínima.

**Peticiones de ejemplo**

```
humanize this, --academic --lang=de
```
```
--audit this blog post — I want to see what's flagged before deciding
```
```
tighten my cover letter so it sounds like me, --resume --calibrate
[paste 3–5 things you've written]
```
```
soften the error messages in this file, --ux --light
```

Nada es obligatorio. Un "Make this read less like ChatGPT" a secas ejecuta el
modo general en el idioma en que escribiste. El frontmatter de `SKILL.md` lleva
la misma lista de flags para beneficio del agente.

### Archivos enteros y documentos largos

Dale una ruta de archivo o pega algo largo (unas 1.500+ palabras, o cualquier
cosa con secciones tituladas) y cambia a **modo Documento**:

- **Audita primero** — una lista de hallazgos (`patrón → sección → severidad`),
  sin reescribir, hasta que digas "apply the fixes".
- **Congela la estructura** — encabezados, orden de secciones, tablas, figuras,
  ecuaciones, código, notas y cada cita quedan exactamente igual; solo se toca
  la prosa.
- **Salta secciones limpias** — la puerta de no-edición corre por sección.
- **Devuelve solo los tramos cambiados** — `before → after` por cada pasaje
  editado más un resumen corto por sección, nunca el documento entero
  regenerado en la respuesta.
- **Escribe en el mismo formato** — `paper.md` → `paper.humanized.md`,
  `thesis.tex` → `thesis.humanized.tex` (LaTeX/mates/`\cite{}` preservados); el
  original nunca se sobrescribe. Los formatos que no puede reconstruir con
  fidelidad (`.docx`, `.pdf`, …) reciben la lista de tramos para aplicar en tu
  propio editor.

**Lo único que la instalación no puede hacer:** acotarse a un subconjunto de
modos o idiomas. El motor entero se instala siempre (unos cientos de KB de
Markdown), y `SKILL.md` carga solo los pocos archivos que cada petición
necesita. No existe `npx skills add … --modes=…` ni `--langs=…` — la CLI
comunitaria `npx skills` no reenvía flags personalizados a una skill, y el
diseño no lo necesita.

---

## Instalar con `npx skills` (recomendado — funciona en 30+ agentes de código)

`npx skills` es una CLI comunitaria de terceros (el paquete `skills` en npm,
ecosistema liderado por `vercel-labs/skills`) — no un producto de Anthropic.
Lee un repo público de GitHub, encuentra archivos `SKILL.md` y los copia o
enlaza en los agentes que detecta en tu máquina (Claude Code, Cursor, opencode,
Codex, Kiro y otros). No necesitas publicar nada en npm; trabaja directamente
contra el repo.

> **Estado:** aún no publicado. Los comandos usan la ruta prevista
> `gencharitaci/humanize-skills`; funcionan cuando el repo sea público.

### 1. Sube este repo a GitHub
```bash
git init
git add .
git commit -m "Add humanize-skills"
git remote add origin https://github.com/gencharitaci/humanize-skills.git
git branch -M main
git push -u origin main
```
El repo debe ser **público** — `npx skills` lo lee por HTTPS plano por defecto.

### 2. Instálalo
```bash
npx skills add gencharitaci/humanize-skills
```
Lista la única skill que encuentra (`humanize-skills`) y pregunta en qué
agente(s) instalarla. Para instalación no interactiva:
```bash
npx skills add gencharitaci/humanize-skills --skill humanize-skills -a claude-code -y
```
Variaciones útiles:
```bash
# Vista previa sin instalar nada
npx skills add gencharitaci/humanize-skills --list

# Instalación global (todos tus proyectos) en vez de solo el actual
npx skills add gencharitaci/humanize-skills --skill humanize-skills -g -y

# Para cada agente que npx skills detecte en tu máquina
npx skills add gencharitaci/humanize-skills --skill humanize-skills -a '*' -y
```
`npx skills` enlaza por defecto para que las actualizaciones sean en vivo; en
Windows, donde los enlaces requieren permisos elevados, añade `--copy` y
re-ejecuta `npx skills update` tras un cambio. La skill entera es Markdown —
`references/` acompaña a `SKILL.md` automáticamente.

### 3. Verifica, actualiza o elimina
```bash
npx skills list                          # confirma la instalación
npx skills update                        # trae la última versión de tu repo
npx skills remove humanize-skills        # desinstala (añade -g si fue global)
```

### 4. Rutas manuales — sin npx

El `npx skills` de arriba escribe automáticamente en estos mismos directorios.
Copia la carpeta `skills/humanize-skills/` a mano solo si la CLI no cubre tu
configuración. Las rutas de proyecto son relativas a la raíz del repo; las
globales, al home.

| Agente | Ruta de proyecto | Ruta global |
|---|---|---|
| Claude Code | `.claude/skills/humanize-skills/` | `~/.claude/skills/humanize-skills/` |
| Codex CLI | `.codex/skills/humanize-skills/` | `~/.codex/skills/humanize-skills/` |
| Cursor | `.cursor/skills/humanize-skills/` | `~/.cursor/skills/humanize-skills/` |
| opencode | `.opencode/skills/humanize-skills/` | `~/.config/opencode/skills/humanize-skills/` |
| Kilo Code | `.kilocode/skills/humanize-skills/` | `~/.kilocode/skills/humanize-skills/` |
| Gemini CLI | `.gemini/skills/humanize-skills/` | `~/.gemini/skills/humanize-skills/` |
| Alternativa común (Amp, Roo, Copilot, otros) | `.agents/skills/humanize-skills/` | `~/.agents/skills/humanize-skills/` |

```bash
# Ejemplo: opencode, a nivel proyecto
cp -r skills/humanize-skills .opencode/skills/humanize-skills
# Ejemplo: Kilo Code, global (PowerShell)
Copy-Item -Recurse skills/humanize-skills ~/.kilocode/skills/humanize-skills
```

opencode también lee las rutas compatibles con Claude (`.claude/skills/`) y con
agentes (`.agents/skills/`), y Cursor lee ambas también — una copia en
cualquiera de los dos sitios sirve a ambos agentes en la misma máquina. El
frontmatter de la skill usa solo los campos centrales compartidos (`name`,
`description`, `license`) que todo agente lee; los campos desconocidos se
ignoran, así que no hace falta variante por agente. Verifica con la propia
lista de skills del agente (Claude Code: `/skills`; opencode: la herramienta
`skill`; Cursor: **Customize → Skills**) e invócala en palabras llanas —
"humanize this, --academic" funciona idéntico en todas partes.

---

## Alternativa: instalar directo en Claude (sin npx, sin GitHub)

Si no quieres publicar un repo, puedes entregar la skill a Claude a mano.

### Claude.ai, Claude Desktop o Cowork
1. Comprime solo la carpeta interior `humanize-skills/` (la que contiene
   `SKILL.md` directamente — **no** la carpeta envoltorio `skills/`), para que
   `references/` quede junto a `SKILL.md` dentro del zip:
    ```bash
    cd skills && zip -r humanize-skills.zip humanize-skills
    ```
2. En la app: **Settings → Customize → Skills → + → + Create skill** → sube ese ZIP.
3. Confirma que el interruptor queda encendido. *Team/Enterprise:* un admin puede
   provisionarla para todos desde **Organization settings → Skills**; en ambos
   casos, **Code execution and file creation** y **Skills** deben estar activados
   antes.

### Claude Code (manual, sin npx)
```bash
cp -r skills/humanize-skills ~/.claude/skills/humanize-skills      # personal, todos los proyectos
# o
cp -r skills/humanize-skills .claude/skills/humanize-skills        # solo este proyecto
```
Verifica con `/skills` en una sesión, o `claude --list-skills`.

### Claude API
Vía `container.skills` en la Messages API (requiere la beta de Code Execution
Tool) — ver la documentación de Anthropic "Using Agent Skills with the API"
para el formato actual. Sube `SKILL.md` y todo el árbol `references/` junto.

---

## Usarla con ChatGPT, Gemini o cualquier otro asistente

Estas herramientas no leen el formato de carpetas `SKILL.md`, y esta skill es
un enrutador más que un prompt autocontenido — así que monta las piezas que la
petición necesite y pégalas en el campo de instrucciones persistentes (Custom
Instructions de ChatGPT o instrucciones de un Proyecto, instrucciones de un Gem
de Gemini, o equivalente):

1. `skills/humanize-skills/SKILL.md` — el cuerpo bajo el frontmatter (puerta de
   no-edición, orden de carga, precedencia, fact-lock).
2. `references/core-rules.md` y `references/structural-pass.md` — siempre.
3. `references/languages/<tu-idioma>.md` — el catálogo del idioma en que escribes.
4. `references/modes/<tu-modo>.md` — `general.md` si dudas.
5. Solo si quieres igualar tu voz: `references/voice-calibration.md`.

Concatenado son unas pocas páginas — cabe en un campo de instrucciones. Omite
el archivo de idioma solo si aún no existe uno para el tuyo; en ese caso
díselo a la herramienta y deja que aplique `core-rules.md` solo, sin improvisar.

---

## Una nota honesta

Esta skill elimina patrones que hacen la escritura formulaica, y de paso la
hace menos propensa a activar detectores de IA basados en patrones — porque eso
es literalmente lo que las reglas quitan. No es garantía contra la detección:
los detectores no son fiables en ninguna dirección, y no cambia si debes o no
divulgar el uso de IA en un contexto dado. Si la usas donde se exige divulgar
asistencia de IA — una política escolar, las normas de una publicación, la
prohibición de Wikipedia sobre contenido LLM no divulgado — seguir una guía de
estilo no cumple ese requisito. Solo mejora la prosa.

---

## Contribuir

Las dos contribuciones de más valor son la **revisión por hablantes nativos de
los catálogos de idioma** y **ejecutar el chequeo ciego de elección forzada
sobre los fixtures dorados**. Ver [`CONTRIBUTING.md`](CONTRIBUTING.md). Los
fixtures de `references/examples/` son hoy modelo-generados y sin revisar —
disparadores de regresión, no un estándar dorado validado.

## Licencia

CC BY 4.0 (Creative Commons Attribution 4.0 International) — ver
[`LICENSE.md`](LICENSE.md). © Adem Kurtipek. Libre para compartir y adaptar,
incluso comercialmente, con atribución.
