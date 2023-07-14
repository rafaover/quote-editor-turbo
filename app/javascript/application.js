import "@hotwired/turbo-rails";
import "./controllers";

// The two following lines disable Turbo on the whole application
import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = false;
